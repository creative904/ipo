import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ipo_tracker/feature/presentation/pages/ipo_detail/widgets/ipo_detail_data_container2.dart';
import 'package:ipo_tracker/google_ads/ad_parameters.dart';
import 'package:ipo_tracker/google_ads/inter_ad_handler.dart';
import 'package:ipo_tracker/router/route_constant.dart';
import 'package:ipo_tracker/router/routes.dart';
import 'package:provider/provider.dart';
import 'package:ipo_tracker/feature/presentation/pages/ipo_detail/widgets/ipo_detail_data_container.dart';
import 'package:ipo_tracker/feature/presentation/pages/ipo_detail/widgets/title_app_bar.dart';
import 'package:ipo_tracker/util/constants/color_constant.dart';

import '../../../../google_ads/ad_helper.dart';
import '../../../../util/constants/string_constant.dart';
import '../../state_management/ipo_detail_provider.dart';

class IpoPasser{
  String? id;
  String? name;
  bool? isFromListedIpo;
  IpoPasser({
    this.id,
    this.name,
    this.isFromListedIpo,
});
}

class IpoDetailPage extends StatefulWidget {
  const IpoDetailPage({super.key, required this.ipoPasser});

  final IpoPasser? ipoPasser;
  @override
  State<IpoDetailPage> createState() => _IpoDetailPageState();
}

class _IpoDetailPageState extends State<IpoDetailPage> {

  IpoDetailProvider? ipoDetailProvider;



  @override
  void initState() {
    if(widget.ipoPasser?.isFromListedIpo ?? false){
      //tap is from listed ipo page
      if(!(AdParameters.isFirstInterFromListedIpoShown)){
        //show ad when user opens the page first time
        AdParameters.isFirstInterFromListedIpoShown=true;
        InterstitialAdHandler.showInterstitialAd(useRandomNumber: false);
      }else{
        InterstitialAdHandler.showInterstitialAd();
      }
    }
    else{
      //tap is from current ipo page
      if(!(AdParameters.isFirstInterFromCurrentIpoShown ?? false)){
        //show ad when user opens the page first time
        AdParameters.isFirstInterFromCurrentIpoShown=true;
        InterstitialAdHandler.showInterstitialAd(useRandomNumber: false);
      }else{
        InterstitialAdHandler.showInterstitialAd();
      }
    }

    ipoDetailProvider=Provider.of<IpoDetailProvider>(context,listen: false);
    ipoDetailProvider?.init();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(widget.ipoPasser?.id!=null) ipoDetailProvider?.callApiIpoDetail(widget.ipoPasser!.id!);
    });


    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Consumer<IpoDetailProvider>(
            builder: (context, ipoDetailProvider,child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TitleAppBar( title: widget.ipoPasser?.name,),
                 Expanded(
                child: Stack(
                children: [
                if(!ipoDetailProvider.isDataLoading)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                    Expanded(child:  IpoDetailDataContainer2(),),
                    InkWell(
                      onTap: (){
                        AppRouter.goRouter.push(AppRouterPath.allotment);
                      },
                      child: Container(
                        color: ColorConstant.primaryColor,
                        padding:  EdgeInsets.symmetric(vertical: 10.h),
                        child: Text(
                          StringConstants.checkAllotment,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: ColorConstant.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],),

                if(ipoDetailProvider.isDataLoading)
                Center(
                child: CircularProgressIndicator(color: ColorConstant.primaryColor,),
                )
                ],
                ),
              ),

                ],
              );
            }
          ),
        )
    );
  }
}
