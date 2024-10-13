import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ipo_tracker/feature/presentation/pages/current_sme/widgets/current_sme_item2.dart';
import 'package:ipo_tracker/google_ads/banner_ad.dart';
import 'package:provider/provider.dart';
import 'package:ipo_tracker/feature/presentation/pages/current_sme/widgets/current_sme_item.dart';

import '../../../../google_ads/ad_helper.dart';
import '../../../../google_ads/native_ad_container.dart';
import '../../../../util/constants/asset_constant.dart';
import '../../../../util/constants/color_constant.dart';
import '../../../../util/constants/string_constant.dart';
import '../../../../util/utility.dart';
import '../../state_management/current_sme_provider.dart';

class CurrentSmePage extends StatefulWidget {
  const CurrentSmePage({super.key});

  @override
  State<CurrentSmePage> createState() => _CurrentSmePageState();
}

class _CurrentSmePageState extends State<CurrentSmePage> {
  CurrentSmeProvider? currentSmeProvider;

  @override
  void initState() {
    currentSmeProvider=Provider.of<CurrentSmeProvider>(context,listen: false);
    super.initState();
  }

  Future<void> _refreshData() async {
    // await Future.delayed(Duration(seconds: 2)); // Simulating network delay
    currentSmeProvider?.callApiCurrentSme();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: ColorConstant.dividerColor,
      child: Column(
        children: [
          BannerAdWidget(),
          SizedBox(height: 8.h,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.w,0,10.w,5.h),
              child: Consumer<CurrentSmeProvider>(
                  builder: (context, currentSmeProvider, child) => currentSmeProvider.isDataLoading
                      ? const Center(
                    child: CircularProgressIndicator(color: ColorConstant.primaryColor,),
                  )
                      : currentSmeProvider.currentSmeList.isNotEmpty
                      ? RefreshIndicator(
                    onRefresh: _refreshData,
                        child: ListView.builder(

                          itemCount: currentSmeProvider.currentSmeList.length, // Show a few shimmer items while loading
                          itemBuilder: (context, index) => CurrentSmeItem2(sme: currentSmeProvider.currentSmeList[index],),
                        ),
                      )
                      : Center(
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(AssetConstant.noData),
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          StringConstants.noNewUpdateFound,
                          style: Utility.textStyle15pxW500GreyTextColor(),
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
