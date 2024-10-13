import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipo_tracker/google_ads/native_ad_container.dart';

import '../../../../util/constants/color_constant.dart';
import '../../../../util/constants/string_constant.dart';
import '../../../../util/utility.dart';
import '../ipo_detail/widgets/title_app_bar.dart';

class RightsInfo extends StatelessWidget {
  const RightsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar:  TitleAppBar(title: StringConstants.rightsInfo),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Card(
                    elevation: 10,
                    margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Utility.borderRadius10),
                    ),
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        decoration: BoxDecoration(
                          color: ColorConstant.white,
                          borderRadius: BorderRadius.circular(Utility.borderRadius5),
                          border: Border.all(
                              color: ColorConstant.black,
                              width: 1.w
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                              child: Text(
                                StringConstants.rightsInfo,
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: ColorConstant.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,

                                  ),
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.fromLTRB(20.w,10.h,10.h,20.h),
                              child: Text(
                                StringConstants.rightsDesc,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: ColorConstant.primaryColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,

                                  ),
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),

                          ],
                        )
                    ),
                  ),
                ),
              ),
              NativeAdContainer()
            ],
          ),
        )
    );
  }
}
