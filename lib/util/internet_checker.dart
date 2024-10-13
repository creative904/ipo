import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ipo_tracker/util/constants/string_constant.dart';
import 'package:ipo_tracker/util/utility.dart';

class InternetChecker{

  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if(connectivityResult[0]==ConnectivityResult.none){
      Utility.showToast(StringConstants.enableInternet);
      return false;
    }
    return true;
  }

}