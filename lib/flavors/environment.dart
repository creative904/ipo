


import 'package:ipo_tracker/flavors/flavor_enum.dart';

import 'package:ipo_tracker/util/constants/api_end_point_constant.dart';



class EnvFlavorConfig {
  static Flavor? appFlavor;
  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.Prod:
        return '${APIEndPoint.baseURLProd}';
      case Flavor.Dev:
        return '${APIEndPoint.baseURLDev}';
      default:
        return  '${APIEndPoint.baseURLDev}';
    }
  }

}

