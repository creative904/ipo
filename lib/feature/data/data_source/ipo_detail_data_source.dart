import 'package:ipo_tracker/common/api_handler/dio_client.dart';
import 'package:ipo_tracker/util/constants/api_end_point_constant.dart';

abstract class IpoDetailDataSource{
  Future<Map<String, dynamic>?> callApiIpoDetail(String id);
  
}

class IpoDetailDataSourceImpl implements IpoDetailDataSource{

  @override
  Future<Map<String, dynamic>?> callApiIpoDetail(String id) async {
    return await  DioClient().doGet('${APIEndPoint.getIpoUrl}/$id', {},);
  }


}
