import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ipo_tracker/google_ads/ad_helper.dart';

class AppOpenAdManager{
  static AppOpenAd? appOpenAd;
  static bool isShowingAd=false;
  static bool isLoaded=false;

  static void loadAd(){
    AppOpenAd.load(
        adUnitId: AdHelper.appOpenAdId,
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
            onAdLoaded: (ad){
              debugPrint("AppOpen Add loaded");
              appOpenAd=ad;
              isLoaded=true;
            },
            onAdFailedToLoad: (error){
              isLoaded=false;
            }
            )
    );
  }

  static void showAdIfAvailable(){
    if(appOpenAd==null){
      loadAd();
      return;
    }
    if(isShowingAd){
      return;
    }
    appOpenAd?.fullScreenContentCallback=FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad){
        isShowingAd=true;
      },
      onAdFailedToShowFullScreenContent: (ad, error){
        isShowingAd=false;
        ad.dispose();
        appOpenAd=null;
      },
      onAdDismissedFullScreenContent: (ad){
        isShowingAd=false;
        ad.dispose();
        appOpenAd=null;
        loadAd();
      }
    );
    appOpenAd?.show();
}

}