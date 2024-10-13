
import 'package:flutter/material.dart';
import 'package:ipo_tracker/util/constants/color_constant.dart';

import 'package:ipo_tracker/util/utility.dart';

class AppThemeNotifier extends ChangeNotifier{
   ThemeMode themeMode=ThemeMode.light;

  /// ThemeData - adjust theme base on settings
  ThemeData get themeData => (themeMode == ThemeMode.light)
      ? ThemeData(
       useMaterial3: false,
        primaryColor: ColorConstant.primaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ColorConstant.primaryColor,
        ),
      // colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.blue),
      fontFamily: 'SFPro',
      // primarySwatch: ColorConstant.kToDarkPrimary,
      // brightness: Brightness.light,

      // colorScheme: ColorScheme.fromSwatch(primarySwatch: ColorConstant.kToDarkPrimary).copyWith(error: ColorConstant.errorColor)
  )
      : ThemeData(
      fontFamily: 'SFPro',
          primarySwatch: ColorConstant.kToDarkPrimary,
          brightness: Brightness.dark,
      // useMaterial3: true,
       );

  void setThemeMode(ThemeMode mode){
    themeMode=mode;
    notifyListeners();
  }

}
