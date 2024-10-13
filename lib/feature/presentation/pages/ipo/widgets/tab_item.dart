import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/constants/color_constant.dart';
import '../../../../../util/utility.dart';

class TabItem extends StatelessWidget {
  TabItem({super.key, required this.icon,required this.title, this.isSelected=false});

  final String icon;
  final String title;
  bool isSelected;

  // @override
  // Widget build(BuildContext context) {
  //   return  Tab(
  //
  //       icon:  SvgPicture.asset(
  //         icon,
  //         height: 19.h,
  //         width: 19.w,
  //         fit: BoxFit.fill,
  //        colorFilter: isSelected ? ColorFilter.mode(ColorConstant.white.withOpacity(1), BlendMode.srcIn): ColorFilter.mode(ColorConstant.greyColorDark.withOpacity(1), BlendMode.srcIn)
  //       ),
  //     text: title,
  //
  //
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 3.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(
              icon,
              height: 18.h,
              width: 18.w,
              colorFilter: isSelected ? ColorFilter.mode(ColorConstant.white.withOpacity(1), BlendMode.srcIn) : ColorFilter.mode(ColorConstant.greyColorDark.withOpacity(1), BlendMode.srcIn)
          ),
          SizedBox(height: 10.h,),
          Text(
            title,
            style:  isSelected  ?
            TextStyle(
                color: ColorConstant.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500)
                :  TextStyle(
                color: ColorConstant.greyColorDark,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500),
               textAlign: TextAlign.center,

          )
        ],
      ),
    );
  }
}
