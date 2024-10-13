import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ipo_tracker/feature/presentation/pages/rights/rights_item.dart';

import '../../../../google_ads/native_ad_container.dart';
import '../../../../router/route_constant.dart';
import '../../../../router/routes.dart';
import '../../../../util/constants/asset_constant.dart';
import '../../../../util/constants/color_constant.dart';
import '../../../../util/constants/string_constant.dart';
import '../../../../util/utility.dart';
import '../../state_management/market_provider.dart';
import '../ipo_detail/widgets/title_app_bar.dart';

class RightsPage extends StatefulWidget {
  const RightsPage({super.key});

  @override
  State<RightsPage> createState() => _RightsPageState();
}

class _RightsPageState extends State<RightsPage> {
  MarketProvider? marketProvider;
  @override
  void initState() {
    marketProvider=Provider.of<MarketProvider>(context,listen: false);
    marketProvider?.callApiRights();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TitleAppBar(title: StringConstants.rights,
          showInfoIcon: true,
          onTapIcon: (){
            AppRouter.goRouter.push(AppRouterPath.rightInfo);
          },
        ),
        body: Column(
          children: [

            Expanded(child: Consumer<MarketProvider>(
                builder: (context, marketProvider, child) => marketProvider.isRightsDataLoading
                    ? const Center(
                  child: CircularProgressIndicator(color: ColorConstant.greenColor,),
                )
                    : marketProvider.rightsList.isNotEmpty
                    ? Container(
                  color: ColorConstant.dividerColor,
                  padding:  EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 5.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: marketProvider.rightsList.length, // Show a few shimmer items while loading
                          itemBuilder: (context, index) => RightsItem(data: marketProvider.rightsList[index],),
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
