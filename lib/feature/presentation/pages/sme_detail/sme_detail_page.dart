

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipo_tracker/feature/presentation/pages/sme_detail/widgets/sme_detail_data_container2.dart';
import 'package:provider/provider.dart';
import 'package:ipo_tracker/feature/presentation/pages/sme_detail/widgets/sme_detail_data_container.dart';
import 'package:ipo_tracker/feature/presentation/state_management/sme_detail_provider.dart';

import '../../../../google_ads/ad_parameters.dart';
import '../../../../google_ads/inter_ad_handler.dart';
import '../../../../router/route_constant.dart';
import '../../../../router/routes.dart';
import '../../../../util/constants/color_constant.dart';
import '../../../../util/constants/string_constant.dart';
import '../ipo_detail/ipo_detail_page.dart';
import '../ipo_detail/widgets/title_app_bar.dart';



class SmeDetail extends StatefulWidget {
  const SmeDetail({super.key, required this.ipoPasser});

  final IpoPasser? ipoPasser;

  @override
  State<SmeDetail> createState() => _SmeDetailState();
}

class _SmeDetailState extends State<SmeDetail> {
  SmeDetailProvider? smeDetailProvider;
  @override
  void initState() {
    if(widget.ipoPasser?.isFromListedIpo ?? false){
      //tap is from listed ipo page
      if(!(AdParameters.isFirstInterFromListedSmeShown)){
        //show ad when user opens the page first time
        AdParameters.isFirstInterFromListedSmeShown=true;
        InterstitialAdHandler.showInterstitialAd(useRandomNumber: false);
      }else{
        InterstitialAdHandler.showInterstitialAd();
      }
    }
    else{
      //tap is from current ipo page
      if(!(AdParameters.isFirstInterFromCurrentSmeShown ?? false)){
        //show ad when user opens the page first time
        AdParameters.isFirstInterFromCurrentSmeShown=true;
        InterstitialAdHandler.showInterstitialAd(useRandomNumber: false);
      }else{
        InterstitialAdHandler.showInterstitialAd();
      }
    }


    smeDetailProvider=Provider.of<SmeDetailProvider>(context,listen: false);
    smeDetailProvider?.init();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(widget.ipoPasser?.id!=null) smeDetailProvider?.callApiIpoDetail(widget.ipoPasser!.id!);
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Consumer<SmeDetailProvider>(
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
                              Expanded(child:  SmeDetailDataContainer2(),),
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
                    )
                  ],
                );
              }
          ),
        )
    );
  }
}
