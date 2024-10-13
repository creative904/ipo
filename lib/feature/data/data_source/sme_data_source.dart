import 'package:ipo_tracker/common/api_handler/dio_client.dart';
import 'package:ipo_tracker/util/constants/api_end_point_constant.dart';

abstract class SmeDataSource{
  Future<Map<String, dynamic>?> callApiListedSme(Map<String, dynamic> jsonData);
  Future<Map<String, dynamic>?> callApiCurrentSme(Map<String, dynamic> jsonData);
}

class SmeDataSourceImpl implements SmeDataSource{

  @override
  Future<Map<String, dynamic>?> callApiCurrentSme(Map<String, dynamic> params) async {
    return await  DioClient().doGet('${APIEndPoint.getSmeUrl}?listed=false', params,);
  }

  @override
  Future<Map<String, dynamic>?> callApiListedSme(Map<String, dynamic> params) async {
    return await  DioClient().doGet('${APIEndPoint.getSmeUrl}?listed=false', params,);
  }
}
