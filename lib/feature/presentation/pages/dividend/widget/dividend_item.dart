import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipo_tracker/util/constants/string_constant.dart';

import '../../../../../util/constants/color_constant.dart';
import '../../../../../util/utility.dart';
import '../../../../data/modals/dividend_modal.dart';

class DividendItem extends StatelessWidget {
  const DividendItem({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Utility.borderRadius10),
      ),
      child:Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
              color: ColorConstant.white,
              border: Border.all(
                  color: ColorConstant.black,
                  width: 1.w
              ),
              borderRadius: BorderRadius.circular(5.r)
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                data.companyName ?? '',
                style: TextStyle(
                    color: ColorConstant.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 20.h,),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                        StringConstants.dividendAmount,
                        style: TextStyle(
                            color: ColorConstant.greyCircleColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp
                        ),
                        textAlign: TextAlign.center,
                      ),
                  ),
                  SizedBox(width: 8.w,),
                  Expanded(
                    child: Text(
                      '₹ ${data.dividenPrice}',
                      style: TextStyle(
                          color: ColorConstant.greenColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp
                      ),
                      textAlign: TextAlign.center,
                    ),)
                ],
              ),
            ),

            SizedBox(height: 8.h,),


            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                StringConstants.dividend,
                style: TextStyle(
                    color: ColorConstant.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Utility.dividerContainer,

            Padding(
              padding:  EdgeInsets.fromLTRB(10.w,3.h,10.w,0),
              child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            StringConstants.type,
                            style: TextStyle(
                                color: ColorConstant.greyCircleColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            data.dividentType ?? '',
                            style: TextStyle(
                                color: ColorConstant.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child:  Column(
                        children: [
                          Text(
                            StringConstants.percent,
                            style: TextStyle(
                                color: ColorConstant.greyCircleColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            '${data.dividenPrice} %',
                            style: TextStyle(
                                color: ColorConstant.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ]
              ),
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                StringConstants.dates,
                style: TextStyle(
                    color: ColorConstant.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 1.h,),
            Utility.dividerContainer,

            SizedBox(height: 5.h, ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      StringConstants.announcementDate,
                      style: TextStyle(
                          color: ColorConstant.greyCircleColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                      child: Text(
                        data.announcementDate ?? '',
                        style: TextStyle(
                            color: ColorConstant.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp
                        ),
                        textAlign: TextAlign.center,
                      ),
                  )
                ],
              ),
            ),
            SizedBox(height: 3.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      StringConstants.recordDate,
                      style: TextStyle(
                          color: ColorConstant.greyCircleColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      data.recordDate ?? '',
                      style: TextStyle(
                          color: ColorConstant.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 3.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      StringConstants.exDividendDate,
                      style: TextStyle(
                          color: ColorConstant.greyCircleColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      data.exDividend ?? '',
                      style: TextStyle(
                          color: ColorConstant.darkRedColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ],
            )
      ),
        );
  }
}
