
import 'package:flutter/material.dart';

class ColorConstant{

  // static const Color primaryColor =  Color(0xFF5746AF);  //purple
  static const Color primaryColor =  Color(0xFF001C69); // navy blue
  static const Color primaryColorLight =  Color(0x4D001C69); // navy blue
  // static const Color primaryColor =  Color(0xFF012BFF); // also good
  // static const Color primaryColor =  Color(0xFF000000);  // black
  static const Color primaryColorBg =  Color(0xFFEDE9FE);
  static const Color primaryColorBorder =  Color(0xFFC4B8F3);
  static const Color greyColor =  Color(0xFFE0E0E0);
  static const Color notificationGreyColor =  Color(0xFFF2F2F5);
  static const Color greyColorDark =  Color(0xFFBDBDBD);
  static const Color greyColorSetting =  Color(0xFFF2F2F5);
  static const Color greyColorSubTile=  Color(0xFFF9F9FB);
  static const Color greyTextColor =  Color(0xFF60646C);
  static const Color disableGreyColor =  Color(0xFF1C2024);
  static const Color white = Color(0xFFFFFFFF);
  static  Color transparentColor = Color(0x00000000);
  static const Color black = Color(0xFF000000);
  static const Color lightBlackColorText = Color(0x99000000);
  static const Color errorColor = Color(0xffd51d25);
  static const Color notificationBoxColor = Color(0xffD84224);
  static const Color dividerColor = Color(0xffDDDDE3);
  static const Color tabsBgColor = Color(0xffE4E4E9);
  static const Color hintTextGreyColor = Color(0xffB9BBC6);
  static const Color darkGrey = Color(0xffEBEBEF);
  static const Color lightGreenColor = Color(0xffE9F9EE);


  // static const Color greenColor = Color(0xff299764);
  static const Color greenColor = Color(0xff03ab69);
  static const Color lightGreenBgColor = Color(0x4D299764);
  static const Color orangeColor = Color(0xffED5F00);
  static const Color lightOrangeColor = Color(0x4ded5f00);
  static const Color blueColor = Color(0xff0880EA);
  static const Color pistaColor = Color(0xff01fde0);
  static const Color lightPistaColor = Color(0x4d01fde0);
  static const Color greyCircleColor = Color(0xff7E808A);
  static const Color darkRedColor = Color(0xffD93D42);
  static const Color darkRedColorLight = Color(0x4dd93d42);
  static const Color lightRedColor = Color(0x4dd93d42);

  static const Color yellowishColor = Color(0xfffd9801);
  static const Color lightYellowishColor = Color(0x4dfd9801);


  static const Color darkGreyColor = Color(0xffD3D4DB);
  // static const Color appLightColor = Color(0xffd01616);


  static const MaterialColor kToDarkPrimary = MaterialColor(
    0xff845128, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFFFFFFFF), //10%
      100: Color(0xFFFFFFFF), //20%
      200: Color(0xFFFFFFFF), //30%
      300: Color(0xFFFFFFFF), //40%
      400: Color(0xFFFFFFFF),//50%
      500: Color(0xFFFFFFFF), //60%
      600: Color(0xFFFFFFFF), //70%
      700: Color(0xFFFFFFFF), //80%
      800: Color(0xFFFFFFFF), //90%
      900: Color(0xFFFFFFFF), //100%
    },
  );


// static const MaterialColor kToDarkPrimary = MaterialColor(
//   0xff845128, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
//   <int, Color>{
//     50: Color(0xffc2a894), //10%
//     100: Color(0xffb5977e), //20%
//     200: Color(0xffa98569), //30%
//     300: Color(0xff9d7453), //40%
//     400: Color(0xff90623d),//50%
//     500: Color(0xff845128), //60%
//     600: Color(0xff774924), //70%
//     700: Color(0xff6a4120), //80%
//     800: Color(0xff5c391c), //90%
//     900: Color(0xff4f3118), //100%
//   },
// );
}