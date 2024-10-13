import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ipo_tracker/feature/presentation/pages/market/widgets/title_container.dart';
import 'package:ipo_tracker/google_ads/banner_ad.dart';
import 'package:ipo_tracker/google_ads/native_ad_container.dart';
import 'package:ipo_tracker/router/route_constant.dart';
import 'package:ipo_tracker/router/routes.dart';
import 'package:ipo_tracker/util/constants/string_constant.dart';
import 'package:provider/provider.dart';

import '../../../../google_ads/ad_helper.dart';
import '../../../../util/constants/asset_constant.dart';
import '../../../../util/constants/color_constant.dart';
import '../../../../util/utility.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {



  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              margin:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
              child: Column(
                children: [
                  TitleContainer(
                    onTap: (){
                      AppRouter.goRouter.push(AppRouterPath.dividend);
                    },
                    title: StringConstants.dividend,
                    bgColor: ColorConstant.lightOrangeColor ,
                    borderColor: ColorConstant.orangeColor ,
                    icon: Icons.trending_up,
                  ),
                  SizedBox(height: 15.h,),
                  TitleContainer(
                    onTap: (){
                      AppRouter.goRouter.push(AppRouterPath.bonus);
                    },
                    title: StringConstants.bonus,
                    bgColor: ColorConstant.lightPistaColor ,
                    borderColor: ColorConstant.pistaColor ,
                    icon: Icons.trending_up,
                  ),
                  SizedBox(height: 15.h,),
                  TitleContainer(
                    onTap: (){
                      AppRouter.goRouter.push(AppRouterPath.split);
                    },
                    title: StringConstants.split,
                    bgColor: ColorConstant.lightRedColor ,
                    borderColor: ColorConstant.darkRedColor ,
                    icon: Icons.trending_up,
                  ),
                  SizedBox(height: 15.h,),
                  TitleContainer(
                    onTap: (){
                      AppRouter.goRouter.push(AppRouterPath.right);
                    },
                    title: StringConstants.rights,
                    bgColor: ColorConstant.lightGreenBgColor ,
                    borderColor: ColorConstant.greenColor ,
                    icon: Icons.trending_up,
                  ),
                  SizedBox(height: 15.h,),
                  TitleContainer(
                    onTap: (){
                      AppRouter.goRouter.push(AppRouterPath.ipoInvestorCat);
                    },
                    title: StringConstants.ipoInvstCategories,
                    bgColor: ColorConstant.primaryColorLight ,
                    borderColor: ColorConstant.primaryColor ,
                    icon: Icons.trending_up,
                  ),





                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h,),
        NativeAdContainer(),
      ],
    );
  }
}
