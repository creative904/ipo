import 'package:ipo_tracker/common/api_handler/dio_client.dart';
import 'package:ipo_tracker/util/constants/api_end_point_constant.dart';

abstract class SmeDetailDataSource{
  Future<Map<String, dynamic>?> callApiSmeDetail(String id);
  
}

class SmeDetailDataSourceImpl implements SmeDetailDataSource{

  @override
  Future<Map<String, dynamic>?> callApiSmeDetail(String id) async {
    return await  DioClient().doGet('${APIEndPoint.getSmeUrl}/$id', {},);
  }


}
