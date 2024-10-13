import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/constants/asset_constant.dart';
import '../../../../../util/constants/color_constant.dart';

class TitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleAppBar({super.key, required this.title, this.showInfoIcon=false,  this.onTapIcon=null,});

  final String? title;
  final bool showInfoIcon;
  final Function()? onTapIcon;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 13.h),
      color: ColorConstant.primaryColor,
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18.h,
                color: ColorConstant.white,
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Text(
             title ?? '',
              style: TextStyle(
                  color: ColorConstant.white,
                  fontSize: 20.sp,
                fontWeight: FontWeight.w500
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          if(showInfoIcon) SizedBox(
            width: 8.w,
          ),
          if(showInfoIcon) InkWell(
            onTap: onTapIcon,
            child: SvgPicture.asset(
                AssetConstant.info,
                width: 25.0,
                height: 25.0,
                fit: BoxFit.fill,
                colorFilter:ColorFilter.mode(ColorConstant.white.withOpacity(1), BlendMode.srcIn)
            ),
          ),

        ],
      ),
    );
  }
}
