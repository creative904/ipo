import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ipo_tracker/feature/presentation/pages/listed_sme/listed_sme_item2.dart';
import 'package:ipo_tracker/google_ads/banner_ad.dart';
import 'package:provider/provider.dart';
import 'package:ipo_tracker/feature/presentation/pages/current_Sme/widgets/current_Sme_item.dart';
import 'package:ipo_tracker/feature/presentation/state_management/listed_sme_provider.dart';

import '../../../../google_ads/ad_helper.dart';
import '../../../../google_ads/native_ad_container.dart';
import '../../../../util/constants/asset_constant.dart';
import '../../../../util/constants/color_constant.dart';
import '../../../../util/constants/string_constant.dart';
import '../../../../util/utility.dart';
import 'listed_sme_item.dart';

class ListedSmePage extends StatefulWidget {
  const ListedSmePage({super.key});

  @override
  State<ListedSmePage> createState() => _ListedSmePageState();
}

class _ListedSmePageState extends State<ListedSmePage> {

  ListedSmeProvider? listedSmeProvider;

  @override
  void initState() {
    listedSmeProvider=Provider.of<ListedSmeProvider>(context,listen: false);
    super.initState();
  }

  Future<void> _refreshData() async {
    // await Future.delayed(Duration(seconds: 2)); // Simulating network delay
    listedSmeProvider?.callApiListedSme();
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
              child: Consumer<ListedSmeProvider>(
                  builder: (context, listedSmeProvider, child) => listedSmeProvider.isDataLoading
                      ? const Center(
                    child: CircularProgressIndicator(color: ColorConstant.primaryColor,),
                  )
                      : listedSmeProvider.listedSmeList.isNotEmpty
                      ? RefreshIndicator(
                    onRefresh: _refreshData,
                    child: ListView.builder(

                      itemCount: listedSmeProvider.listedSmeList.length, // Show a few shimmer items while loading
                      itemBuilder: (context, index) => ListedSmeItem2(sme: listedSmeProvider.listedSmeList[index],),
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
