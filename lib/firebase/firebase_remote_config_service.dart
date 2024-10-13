import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:ipo_tracker/google_ads/ad_helper.dart';

import '../google_ads/inter_ad_handler.dart';
import '../util/internet_checker.dart';

class FirebaseRemoteConfigService {
  FirebaseRemoteConfigService._() : _remoteConfig = FirebaseRemoteConfig.instance; // MODIFIED

  static FirebaseRemoteConfigService? _instance; // NEW
  factory FirebaseRemoteConfigService() => _instance ??= FirebaseRemoteConfigService._(); // NEW

  final FirebaseRemoteConfig _remoteConfig;


  Future<void> initialize() async {
    await _setConfigSettings();
    // await _setDefaults();
    await fetchAndActivate();

    AdHelper.bannerAdId=_remoteConfig.getString(FirebaseRemoteConfigKeys.bannerAdId);
    AdHelper.nativeAdId=_remoteConfig.getString(FirebaseRemoteConfigKeys.nativeAdId);
    AdHelper.interAdId=_remoteConfig.getString(FirebaseRemoteConfigKeys.interAdId);
    AdHelper.appOpenAdId=_remoteConfig.getString(FirebaseRemoteConfigKeys.appOpenAdId);

    InterstitialAdHandler.loadInterstitialAd();
  }

  Future<void> fetchAndActivate() async {
    bool isConnected= await InternetChecker.checkInternetConnection();
    if(!isConnected) return;
    bool updated = await _remoteConfig.fetchAndActivate();

    if (updated) {
      debugPrint('The config has been updated.');
    } else {
      debugPrint('The config is not updated..');
    }
  }

  // Future<void> _setDefaults() async => _remoteConfig.setDefaults(
  //   {
  //     FirebaseRemoteConfigKeys.bannerAdId: AdHelper.bannerAdUnitId,
  //     FirebaseRemoteConfigKeys.nativeAdId: AdHelper.bannerAdUnitId,
  //     FirebaseRemoteConfigKeys.interAdId: AdHelper.bannerAdUnitId,
  //     FirebaseRemoteConfigKeys.appOpenId: AdHelper.bannerAdUnitId,
  //   },
  // );

  Future<void> _setConfigSettings() async => _remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 15),
    ),
  );

  String getString(String key) => _remoteConfig.getString(key); // NEW
  bool getBool(String key) =>_remoteConfig.getBool(key); // NEW
  int getInt(String key) =>_remoteConfig.getInt(key); // NEW
  double getDouble(String key) =>_remoteConfig.getDouble(key); // NEW
}

class FirebaseRemoteConfigKeys {
  static const String bannerAdId = 'bannerAdId';
  static const String nativeAdId = 'nativeAdId';
    static const String interAdId = 'interAdId';
  static const String appOpenAdId = 'appOpenAdId';
}