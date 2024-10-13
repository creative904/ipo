import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ipo_tracker/util/screen_size.dart';
import 'package:ipo_tracker/util/utility.dart';

import '../util/constants/color_constant.dart';
import 'ad_helper.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {

  BannerAd? _bannerAd;
  @override
  void initState() {
    debugPrint("Banner Ad loading start");
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdId,
      size: AdSize(width: ScreenSize.size?.width.toInt() ??  320, height: 60),
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('Banner Ad loaded successfully');
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('Failed to load banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    );

    _bannerAd?.load();
    super.initState();
  }
  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return _bannerAd != null ?  Container(
      alignment: Alignment.center,
      color: ColorConstant.dividerColor,
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd!,),
    ) : Container();
  }
}

