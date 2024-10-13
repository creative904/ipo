import 'package:ipo_tracker/common/api_handler/dio_client.dart';
import 'package:ipo_tracker/util/constants/api_end_point_constant.dart';

abstract class IpoDataSource{
  Future<Map<String, dynamic>?> callApiListedIpo(Map<String, dynamic> jsonData);
  Future<Map<String, dynamic>?> callApiCurrentIpo(Map<String, dynamic> jsonData);
}

class IpoDataSourceImpl implements IpoDataSource{

  @override
  Future<Map<String, dynamic>?> callApiCurrentIpo(Map<String, dynamic> params) async {
    return await  DioClient().doGet('${APIEndPoint.getIpoUrl}?listed=false', params,);
  }

  @override
  Future<Map<String, dynamic>?> callApiListedIpo(Map<String, dynamic> params) async {
    return await  DioClient().doGet('${APIEndPoint.getIpoUrl}?listed=true', params,);
  }
}
