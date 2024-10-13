import 'package:ipo_tracker/common/api_handler/dio_client.dart';
import 'package:ipo_tracker/util/constants/api_end_point_constant.dart';

abstract class MarketDataSource{
  Future<Map<String, dynamic>?> callApiDividend(Map<String, dynamic> jsonData);
  Future<Map<String, dynamic>?> callApiSplits(Map<String, dynamic> jsonData);
  Future<Map<String, dynamic>?> callApiBonus(Map<String, dynamic> jsonData);
  Future<Map<String, dynamic>?> callApiRights(Map<String, dynamic> jsonData);
}

class MarketDataSourceImpl implements MarketDataSource{

  @override
  Future<Map<String, dynamic>?> callApiDividend(Map<String, dynamic> params) async {
    return await  DioClient().doGet(APIEndPoint.getDividendUrl, params,);
  }

  @override
  Future<Map<String, dynamic>?> callApiSplits(Map<String, dynamic> params) async {
    return await  DioClient().doGet(APIEndPoint.getSplitsUrl, params,);
  }
  @override
  Future<Map<String, dynamic>?> callApiBonus(Map<String, dynamic> params) async {
    return await  DioClient().doGet(APIEndPoint.getBonusUrl, params,);
  }
  @override
  Future<Map<String, dynamic>?> callApiRights(Map<String, dynamic> params) async {
    return await  DioClient().doGet(APIEndPoint.getRightsUrl, params,);
  }
}
