import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ipo_tracker/util/constants/bool_constant.dart';
import 'package:ipo_tracker/util/constants/color_constant.dart';
import 'package:ipo_tracker/util/constants/value_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ipo_tracker/di/injection_container.dart';
import 'package:ipo_tracker/secure_storage/flutter_secure_storege_instance.dart';
import 'package:ipo_tracker/secure_storage/shared_prefrence_keys.dart';


class Utility {


  static Future<void> removeKeychainOnReInstallation() async {
    // Clear the keychain on first run or re-installation
    final hasRunBefore = await SharedPreferences.getInstance();

    if (hasRunBefore.getBool(SharedPreferencesKeys.hasRunBefore) ?? true) {
      await getIt<SecureSharedPreInstance>().secureStorage.deleteAll();
      await hasRunBefore.clear();
      hasRunBefore.setBool(SharedPreferencesKeys.hasRunBefore, false);
    }
  }

  static void showToast(String string) {
    if(Platform.isIOS)   FocusManager.instance.primaryFocus?.unfocus();
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: string,
      timeInSecForIosWeb: 3,
      backgroundColor: ColorConstant.primaryColor,
      fontSize: 16,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }


  static void printLog(String tag, String string) {
    print('$tag : $string');
    if (BoolConstant.logs) {
      if (kDebugMode) {
        print('$tag : $string');
      }
    }
  }


  static double borderRadius120=120.r;
  static double borderRadius5=5.0.r;
  static double borderRadius10=10.0.r;
  static double borderRadius30=30.0.r;

  static Container dividerContainer= Container(
    color: ColorConstant.dividerColor,
    height: 1.h,
  );
  static Container dividerContainerPrimary= Container(
    color: ColorConstant.primaryColor,
    height: 1.h,
  );
  static Container dividerContainerBlack= Container(
    color: ColorConstant.black,
    height: 1.h,
  );

  static Container verticalDividerContainer= Container(
    width: 1.w,
    height: 30.h,
    color: ColorConstant.dividerColor,
  );
  static TextStyle textStyle14pxW400Black() => TextStyle(color: ColorConstant.black, fontSize: ValueConstants.fontSizeInPoints14, fontWeight: FontWeight.w400);
  static TextStyle textStyle20pxW500Black() => TextStyle(color: ColorConstant.black, fontSize: ValueConstants.fontSizeInPoints20, fontWeight: FontWeight.w500);
  static TextStyle textStyle14pxW400Green() => TextStyle(color: Colors.green, fontSize: ValueConstants.fontSizeInPoints14, fontWeight: FontWeight.w400);
  static TextStyle textStyle14pxW400Primary() => TextStyle(color: ColorConstant.primaryColor, fontSize: ValueConstants.fontSizeInPoints14, fontWeight: FontWeight.w400);
  static TextStyle textStyle17pxW400White() => TextStyle(color: ColorConstant.white, fontSize: ValueConstants.fontSizeInPoints17, fontWeight: FontWeight.w400);
  static TextStyle textStyle14pxW400Grey() => TextStyle(color: ColorConstant.greyColorDark, fontSize: ValueConstants.fontSizeInPoints14, fontWeight: FontWeight.w400);
  static TextStyle textStyle14pxW400White() => TextStyle(color: ColorConstant.white, fontSize: ValueConstants.fontSizeInPoints14, fontWeight: FontWeight.w400);
  static TextStyle textStyle15pxW500GreyTextColor() => TextStyle(color: ColorConstant.greyTextColor, fontSize: ValueConstants.fontSizeInPoints15, fontWeight: FontWeight.w500);

}
