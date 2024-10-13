import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ipo_tracker/google_ads/native_ad_container.dart';
import 'package:ipo_tracker/router/route_constant.dart';
import 'package:ipo_tracker/router/routes.dart';
import 'package:provider/provider.dart';
import 'package:ipo_tracker/feature/presentation/pages/dividend/widget/dividend_item.dart';
import 'package:ipo_tracker/feature/presentation/pages/ipo_detail/widgets/title_app_bar.dart';
import 'package:ipo_tracker/feature/presentation/state_management/market_provider.dart';

import '../../../../util/constants/asset_constant.dart';
import '../../../../util/constants/color_constant.dart';
import '../../../../util/constants/string_constant.dart';
import '../../../../util/utility.dart';
import '../current_ipo/widgets/current_ipo_item.dart';

class DividendPage extends StatefulWidget {
  const DividendPage({super.key});

  @override
  State<DividendPage> createState() => _DividendPageState();
}

class _DividendPageState extends State<DividendPage> {

  MarketProvider? marketProvider;
  @override
  void initState() {
    marketProvider=Provider.of<MarketProvider>(context,listen: false);
    marketProvider?.callApiDividend();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:    TitleAppBar(
          title: StringConstants.dividend,
          showInfoIcon: true,
          onTapIcon: (){
            AppRouter.goRouter.push(AppRouterPath.dividendInfo);
          },
        ),
        body: Column(
          children: [

            Expanded(child: Consumer<MarketProvider>(
                builder: (context, marketProvider, child) => marketProvider.isDividendDataLoading
                    ? const Center(
                  child: CircularProgressIndicator(color: ColorConstant.orangeColor,),
                )
                    : marketProvider.dividendList.isNotEmpty
                    ? Container(
                  color: ColorConstant.dividerColor,
                  padding:  EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 5.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: marketProvider.dividendList.length, // Show a few shimmer items while loading
                          itemBuilder: (context, index) => DividendItem(data: marketProvider.dividendList[index],),
                        ),
                      ],
                    ),
                  ),
                )
                    : Center(
                  child: Column(
      
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(AssetConstant.noData),
                        height: 120,
                        width: 120,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        StringConstants.noNewUpdateFound,
                        style: Utility.textStyle15pxW500GreyTextColor(),
                      )
                    ],
                  ),
                )),),
            NativeAdContainer()

          ],
        ),
      ),
    );
  }
}
