

import 'package:ipo_tracker/flavors/environment.dart';

class APIEndPoint {
  APIEndPoint._();
  static const int timeOut = 30000;
  // static String refreshToken = "/api/User/Refresh";

  static String baseURLDev = 'https://stock-market-backend-1nm0.onrender.com/';
  static String baseURLProd = 'https://stock-market-backend-1nm0.onrender.com/';

  static String baseURL = EnvFlavorConfig.baseUrl;


  // static String deviceTokenUrl = "${EnvFlavorConfig.baseUrl}api/User/DeviceToken";
  static String getIpoUrl = '${baseURL}api/ipo';
  static String getSmeUrl = '${baseURL}api/sme';

  static String getDividendUrl = '${baseURL}api/dividend';
  static String getRightsUrl = '${baseURL}api/rights';
  static String getSplitsUrl = '${baseURL}api/splits';
  static String getBonusUrl = '${baseURL}api/bonus';


}