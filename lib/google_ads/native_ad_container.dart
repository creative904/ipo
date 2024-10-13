import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ipo_tracker/util/constants/color_constant.dart';

import 'ad_helper.dart';

class NativeAdContainer extends StatefulWidget {
  const NativeAdContainer({super.key, this.nativeAdTemplateStyle=0});

  final int nativeAdTemplateStyle;//0 for small, 1 for big
  @override
  _NativeAdContainerState createState() => _NativeAdContainerState();
}

class _NativeAdContainerState extends State<NativeAdContainer> {
  NativeAd? _nativeAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    _loadNativeAd();
    super.initState();

  }

  void _loadNativeAd() {
     _nativeAd= NativeAd(

        nativeAdOptions: NativeAdOptions(
          adChoicesPlacement: AdChoicesPlacement.bottomLeftCorner

        ),
      adUnitId: AdHelper.nativeAdId,
      factoryId: 'factoryId',
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          _isAdLoaded = false;
        },
      ),
      request: AdRequest(),
      nativeTemplateStyle:NativeTemplateStyle(
          templateType: widget.nativeAdTemplateStyle==0 ? TemplateType.small:TemplateType.medium,

      )
    );
     _nativeAd?.load();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isAdLoaded
        ? Container(
      constraints: BoxConstraints(
        maxHeight: widget.nativeAdTemplateStyle==0 ? 100 : 300// for small native ads. 300 for big native ads
      ),
      child: AdWidget(ad: _nativeAd!),
    )
        : SizedBox.shrink();
  }
}




