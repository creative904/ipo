import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:ipo_tracker/flavors/environment.dart';
import 'package:ipo_tracker/flavors/flavor_enum.dart';
import 'package:ipo_tracker/main_common.dart';


void main() {
  EnvFlavorConfig.appFlavor=Flavor.Prod;
  runZonedGuarded<Future<void>>(() async {
    mainCommon();
  }, (error,  stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}