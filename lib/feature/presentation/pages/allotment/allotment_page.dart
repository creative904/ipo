import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipo_tracker/google_ads/native_ad_container.dart';
import 'package:ipo_tracker/util/constants/string_constant.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../google_ads/inter_ad_handler.dart';
import '../../../../util/constants/color_constant.dart';
import '../ipo_detail/widgets/title_app_bar.dart';


class AllotmentPage extends StatefulWidget {
  const AllotmentPage({super.key});

  @override
  State<AllotmentPage> createState() => _AllotmentPageState();
}

class _AllotmentPageState extends State<AllotmentPage> {

  bool isLoaded=false;
  WebViewController? controller;

  @override
  void initState() {
    InterstitialAdHandler.showInterstitialAd(useRandomNumber: false);
    controller= WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
    NavigationDelegate(
    onProgress: (int progress) {},
    onPageStarted: (String url) {
    setState(() {
      isLoaded=false;
    });
    },
    onPageFinished: (String url) {
      setState(() {
        isLoaded=true;
      });
    },
    onHttpError: (HttpResponseError error) {},
    onWebResourceError: (WebResourceError error) {},
    onNavigationRequest: (NavigationRequest request) => NavigationDecision.navigate,
    ),
    )
    ..loadRequest(Uri.parse(StringConstants.allotmentUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: TitleAppBar( title: StringConstants.checkAllotment,),
          body:
            Column(
              children: [
                Expanded(
                  child: isLoaded ?  (controller !=null ?WebViewWidget(
                    controller: controller!,

                  ) : Container(
                    child: Text(
                      'Something went wrong',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: ColorConstant.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),),
                      textAlign: TextAlign.center,

                    ),
                  ))
                      : Center(
                    child: CircularProgressIndicator(color: ColorConstant.primaryColor,),
                  ),
                ),
                NativeAdContainer()
              ],
            ),


        )
    );
  }
}

