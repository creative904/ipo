import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:ipo_tracker/provider_list.dart';
import 'package:ipo_tracker/push_notification/push_notification.dart';
import 'package:ipo_tracker/util/constants/color_constant.dart';
import 'package:ipo_tracker/util/utility.dart';
import 'package:ipo_tracker/di/injection_container.dart' as di;
import 'package:ipo_tracker/my_app.dart';

import 'firebase/firebase_remote_config_service.dart';
import 'firebase_options.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// ignore: strict_raw_type
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

@pragma('vm:entry-point')
Future<void> myBackgroundMessageHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print('back ground ${message.toMap()}');
  }
  final messageRemote = message.toMap();

  if (messageRemote.containsKey('data')) {
    // Handle data message
    final dynamic data = messageRemote['data'];
    if (kDebugMode) {
      print('back ground $data');
    }
  }

  if (messageRemote.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = messageRemote['notification'];
    if (kDebugMode) {
      Utility.printLog('back ground', notification);
    }
  }
}



void mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseRemoteConfigService().initialize();
  // unawaited(MobileAds.instance.initialize());// you can uae await also
  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  if (!kIsWeb && kDebugMode && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }
  await di.init();





  // PushNotificationsManager().init();
  if(Platform.isIOS) await Utility.removeKeychainOnReInstallation();

  // FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
  // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown],
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: ColorConstant.primaryColor,
      statusBarIconBrightness: Brightness.light,
      // systemNavigationBarColor: ColorConstant.white,
      // systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    MultiProvider(
      providers: ListProvider.providerList,
        child:const FlavorBanner(child:  MyApp()))
  );

}
