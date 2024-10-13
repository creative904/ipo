
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ipo_tracker/util/constants/color_constant.dart';
import 'package:ipo_tracker/util/constants/asset_constant.dart';
import 'package:ipo_tracker/util/constants/string_constant.dart';
import 'package:ipo_tracker/util/utility.dart';

import '../../../state_management/home_page_provider.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, homePageProvider, child) => BottomNavigationBar(
          currentIndex: homePageProvider.selectedIndex,
          onTap: (index) => homePageProvider.setBottomIndex(index),
          items: [
            buildBottomNavigationBarItem(AssetConstant.home, StringConstants.ipo,0, homePageProvider.selectedIndex),
            buildBottomNavigationBarItem(AssetConstant.home, StringConstants.sme,1, homePageProvider.selectedIndex),
            buildBottomNavigationBarItem(AssetConstant.home, StringConstants.market,2, homePageProvider.selectedIndex),
          ],
          selectedItemColor: ColorConstant.primaryColor,
          unselectedItemColor: ColorConstant.greyColorDark,
          backgroundColor: ColorConstant.white,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(String assetName,String assetTitle, int index, int selectedIndex) {
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          color: selectedIndex == index ? ColorConstant.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(Utility.borderRadius5),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 8.h),
        margin: EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // SvgPicture.asset(
            //   assetName,
            //   height: 18.h,
            //   width: 18.w,
            //   colorFilter: selectedIndex == index ? ColorFilter.mode(ColorConstant.white.withOpacity(1), BlendMode.srcIn) : ColorFilter.mode(ColorConstant.black.withOpacity(1), BlendMode.srcIn)
            // ),
            // SizedBox(height: 2.h,),
            Text(
              assetTitle,
              style:  selectedIndex == index ?
              GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: ColorConstant.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500)
              )
                :
            GoogleFonts.poppins(
            textStyle: TextStyle(
            color: ColorConstant.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
              ),
              textAlign: TextAlign.center,

            )
          ],
        ),
      ),
      label: '',
    );
  }
}


