import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipo_tracker/util/constants/string_constant.dart';

import '../../../../../util/constants/asset_constant.dart';
import '../../../../../util/constants/color_constant.dart';
import '../../../../../util/utility.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({super.key,
    required this.bgColor,
    required this.borderColor,
    required this.title,
    required this.onTap,
  required this.icon}
      );

  final Color bgColor;
  final Color borderColor;
  final String title;
  final IconData icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
        decoration:  BoxDecoration(
            color: bgColor ,
            borderRadius: BorderRadius.circular(Utility.borderRadius5),
            border: Border.all(
              color: borderColor
            )
        ),
        child: Row(
          children: [
            // Padding(
            //   padding:  EdgeInsets.symmetric(horizontal: 5.w),
            //   child: SvgPicture.asset(
            //       icon,
            //       width: 20.0,
            //       height: 20.0,
            //       colorFilter:ColorFilter.mode(ColorConstant.black.withOpacity(1), BlendMode.srcIn)
            //   ),
            // ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.w),
              child: Icon(
                icon,
                size: 22,
                color: ColorConstant.black,
              )
            ),
            SizedBox(width: 8.w,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                title,

                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 16.sp,
                      color: ColorConstant.black,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
