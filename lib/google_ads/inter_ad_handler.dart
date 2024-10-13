
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_helper.dart';

class InterstitialAdHandler extends ChangeNotifier{

  static int numInterstitialLoadAttempts = 0;
  static int maxFailedLoadAttempts = 1;


  static InterstitialAd? interstitialAd;
  static void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interAdId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            // onAdDismissedFullScreenContent: (ad) {
            //   _moveToHome();
            // },
          );
          interstitialAd = ad;
          numInterstitialLoadAttempts=0;
          interstitialAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (err) {
          debugPrint('Failed to load an interstitial ad: ${err.message}');
          numInterstitialLoadAttempts += 1;
          interstitialAd = null;
          if (numInterstitialLoadAttempts < maxFailedLoadAttempts) {
            loadInterstitialAd();
          }
        },
      ),
    );
  }

  static void showInterstitialAd({bool useRandomNumber=true}){
    int randomNumber = Random().nextInt(3); // random number generator
    debugPrint("randomNumber:$randomNumber");
    if(useRandomNumber){
      if(randomNumber!=1){
        return;
      }
    }
    if (interstitialAd != null) {
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) {
          debugPrint('ad onAdShowedFullScreenContent.');
        },
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          debugPrint('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
          loadInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          loadInterstitialAd();
        },
      );

      interstitialAd?.show();
      interstitialAd = null;
    }

  }

}