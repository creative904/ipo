import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'package:ipo_tracker/secure_storage/app_shared_preferences.dart';
import 'package:ipo_tracker/secure_storage/shared_prefrence_keys.dart';
import 'package:ipo_tracker/util/utility.dart';
import 'package:ipo_tracker/util/constants/string_constant.dart';

class PushNotificationsManager {
  BigPictureStyleInformation? bigPictureStyleInformation;
  String? bigPicturePath;
  String largeIconPath = '';
  AndroidNotificationDetails? androidNotificationDetails;
  NotificationDetails? notificationSetting;

  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;
  static final PushNotificationsManager _instance = PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  AndroidNotificationChannel channel = AndroidNotificationChannel(
    StringConstants.channelId,
    StringConstants.channelName,
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
    enableLights: true,
  );

  Future<void> init() async {
    // Request notification permissions
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );

    await _firebaseMessaging.setAutoInitEnabled(true);
    _firebaseMessaging.getInitialMessage();

    // Initialize notifications
    final androidInit = const AndroidInitializationSettings('notification_icon');
    final InitializationSettings initializationSettings = InitializationSettings(
      android: androidInit,
      iOS: const DarwinInitializationSettings(

      ),
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Android notification details setting
    androidNotificationDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      importance: Importance.max,
      icon: 'notification_icon',
      priority: Priority.max,
    );

    // iOS notification details
    final DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
      presentBadge: true,
      presentSound: true,
      presentAlert: true,
    );

    notificationSetting = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    final NotificationSettings settings = await _firebaseMessaging.requestPermission();

    await _firebaseMessaging.subscribeToTopic(StringConstants.notificationTopic);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        showNotification(message);
        // increaseNotification();
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        // increaseNotification();
        Utility.printLog('on open ',message.data.toString());
      });
    } else {
      if (Platform.isAndroid) Utility.showToast('Please Enable Push Notification');
    }

    // For testing purposes print the Firebase Messaging token
    await fcmTokenGet();
  }

  Future<String> fcmTokenGet() async {
    String? token;
    try {
      token = await _firebaseMessaging.getToken();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    if (kDebugMode) {
      print('FCM Token: $token');
    }
    await AppSecureSharedPreferences.setStringData(SharedPreferencesKeys.fcm, token ?? '');

    return token ?? '';
  }

  // Future<void> increaseNotification() async {
  //    if(getIt<NavigationService>().navigatorKey.currentContext!=null) {
  //     NotificationNotifier?  notificationNotifier=  Provider.of<NotificationNotifier>(
  //         getIt<NavigationService>().navigatorKey.currentContext!,listen: false);
  //     if (notificationNotifier!=null) {
  //      await notificationNotifier.fetchUnReadCount();
  //     }
  //   }
  // }

  Future<void> showNotification(RemoteMessage message) async {
    final RemoteNotification? notification = message.notification;
    final AndroidNotification? android = message.notification?.android;
    Utility.printLog('on message', message.toMap().toString());

    // Check if image is available or not.
    if (android?.imageUrl != null) {
      largeIconPath = await _downloadAndSaveFile(android?.imageUrl.toString() ?? '', 'largeIcon');
      bigPicturePath = await _downloadAndSaveFile(android?.imageUrl.toString() ?? '', 'bigPicture');
      bigPictureStyleInformation = BigPictureStyleInformation(
        FilePathAndroidBitmap(bigPicturePath!),
        largeIcon: FilePathAndroidBitmap(largeIconPath),
        contentTitle: notification?.title,
        summaryText: notification?.body,
        htmlFormatSummaryText: true,
      );
    }

    if (Platform.isAndroid) {
      if (bigPictureStyleInformation != null) {
        androidNotificationDetails = AndroidNotificationDetails(
          StringConstants.channelId,
          StringConstants.channelName,
          icon: '@drawable/notification_icon',
          importance: Importance.high,
          styleInformation: bigPictureStyleInformation,
        );
      } else {
        androidNotificationDetails = AndroidNotificationDetails(
          StringConstants.channelId,
          StringConstants.channelName,
          icon: '@drawable/notification_icon',
          importance: Importance.high,
        );
      }

      notificationSetting = NotificationDetails(android: androidNotificationDetails);
      await flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification?.title,
        notification?.body,
        notificationSetting,
      );
    }


  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName.jpg';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
}
