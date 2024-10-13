import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ipo_tracker/feature/presentation/pages/bonus/bonus_item.dart';

import '../../../../google_ads/native_ad_container.dart';
import '../../../../router/route_constant.dart';
import '../../../../router/routes.dart';
import '../../../../util/constants/asset_constant.dart';
import '../../../../util/constants/color_constant.dart';
import '../../../../util/constants/string_constant.dart';
import '../../../../util/utility.dart';
import '../../state_management/market_provider.dart';
import '../ipo_detail/widgets/title_app_bar.dart';

class BonusPage extends StatefulWidget {
  const BonusPage({super.key});

  @override
  State<BonusPage> createState() => _BonusPageState();
}

class _BonusPageState extends State<BonusPage> {
  MarketProvider? marketProvider;
  @override
  void initState() {
    marketProvider=Provider.of<MarketProvider>(context,listen: false);
    marketProvider?.callApiBonus();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TitleAppBar(title: StringConstants.bonus,
          showInfoIcon: true,
          onTapIcon: (){
            AppRouter.goRouter.push(AppRouterPath.bonusInfo);
          },
        ),
        body: Column(
          children: [

            Expanded(child: Consumer<MarketProvider>(
                builder: (context, marketProvider, child) => marketProvider.isBonusDataLoading
                    ? const Center(
                  child: CircularProgressIndicator(color: ColorConstant.pistaColor,),
                )
                    : marketProvider.bonusList.isNotEmpty
                    ? Container(
                  color: ColorConstant.dividerColor,
                  padding:  EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 5.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: marketProvider.bonusList.length, // Show a few shimmer items while loading
                          itemBuilder: (context, index) => BonusItem(data: marketProvider.bonusList[index],),
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
