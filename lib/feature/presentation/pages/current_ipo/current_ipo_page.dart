import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ipo_tracker/feature/presentation/pages/current_ipo/widgets/current_ipo_item_2.dart';
import 'package:ipo_tracker/google_ads/banner_ad.dart';
import 'package:ipo_tracker/google_ads/native_ad_container.dart';
import 'package:provider/provider.dart';
import 'package:ipo_tracker/feature/presentation/pages/current_ipo/widgets/current_ipo_item.dart';
import 'package:ipo_tracker/feature/presentation/state_management/current_ipo_provider.dart';

import '../../../../google_ads/ad_helper.dart';
import '../../../../util/constants/asset_constant.dart';
import '../../../../util/constants/color_constant.dart';
import '../../../../util/constants/string_constant.dart';
import '../../../../util/utility.dart';

class CurrentIpoPage extends StatefulWidget {
  const CurrentIpoPage({super.key});

  @override
  State<CurrentIpoPage> createState() => _CurrentIpoPageState();
}

class _CurrentIpoPageState extends State<CurrentIpoPage> {
  CurrentIpoProvider? currentIpoProvider;

  @override
  void initState() {
    currentIpoProvider = Provider.of<CurrentIpoProvider>(context, listen: false);
    super.initState();
  }

  Future<void> _refreshData() async {
    // await Future.delayed(Duration(seconds: 2)); // Simulating network delay
    currentIpoProvider?.callApiCurrentIpo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.dividerColor,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BannerAdWidget(),
          SizedBox(height: 8.h,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.w,0,10.w,5.h),
              child: Consumer<CurrentIpoProvider>(
                  builder: (context, currentIpoProvider, child) => currentIpoProvider
                          .isDataLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: ColorConstant.primaryColor,
                          ),
                        )
                      : currentIpoProvider.currentIpoList.isNotEmpty
                          ? RefreshIndicator(
                              onRefresh: _refreshData,
                              child: currentIpoProvider.currentIpoList.isNotEmpty
                                  ? ListView.builder(
                                      itemCount: currentIpoProvider.currentIpoList
                                          .length, // Show a few shimmer items while loading
                                      itemBuilder: (context, index) => CurrentIpoItem2(
                                        ipo: currentIpoProvider.currentIpoList[index],
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
                                            style: Utility
                                                .textStyle15pxW500GreyTextColor(),
                                          )
                                        ],
                                      ),
                                    ))
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
