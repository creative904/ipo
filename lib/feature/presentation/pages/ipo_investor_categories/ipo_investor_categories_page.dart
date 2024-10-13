import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../google_ads/native_ad_container.dart';
import '../../../../util/constants/color_constant.dart';
import '../../../../util/constants/string_constant.dart';
import '../../../../util/utility.dart';
import '../ipo_detail/widgets/title_app_bar.dart';

class IpoInvestorCategoriesPage extends StatelessWidget {
  const IpoInvestorCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  TitleAppBar(title: StringConstants.ipoInvstCategories),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Qib
                    Card(
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
                                StringConstants.qibTitle,
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
                                StringConstants.qibDesc,
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


                    //Nii
                    Card(
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
                                  StringConstants.niiTitle,
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
                                  StringConstants.niiDesc,
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

                              Padding(
                                padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                                child: Text(
                                  StringConstants.niiCategoriesTitle,
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

                              //nii1
                              Padding(
                                padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                                child: Text(
                                  StringConstants.nii1Title,
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: ColorConstant.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,

                                    ),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.fromLTRB(20.w,10.h,10.h,20.h),
                                child: Text(
                                  StringConstants.nii1Desc,
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
                              //nii2
                              Padding(
                                padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                                child: Text(
                                  StringConstants.nii2Title,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: ColorConstant.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,

                                    ),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.fromLTRB(20.w,10.h,10.h,20.h),
                                child: Text(
                                  StringConstants.nii2Des,
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


                    //Retail

                    Card(
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
                                  StringConstants.retailInvtTitle,
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
                                  StringConstants.retailInvtDesc,
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



                    //Anchor
                    Card(
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
                                  StringConstants.anchorInvtTitle,
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
                                  StringConstants.anchorInvtDesc,
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


                  ],
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
