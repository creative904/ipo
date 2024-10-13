import 'dart:async';


import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:ipo_tracker/util/constants/color_constant.dart';

import 'package:ipo_tracker/flavors/environment.dart';
import 'package:ipo_tracker/flavors/flavor_enum.dart';
import 'package:ipo_tracker/main_common.dart';



// launch app in UAT envirement
void main() {
  EnvFlavorConfig.appFlavor=Flavor.Dev;
  FlavorConfig(
    name: 'Dev-NEW',
    color: ColorConstant.primaryColor,
    location: BannerLocation.bottomEnd,
  );
  runZonedGuarded<Future<void>>(() async {
    mainCommon();
  }, (error,  stack) => FirebaseCrashlytics.instance.recordError(error, stack));

}