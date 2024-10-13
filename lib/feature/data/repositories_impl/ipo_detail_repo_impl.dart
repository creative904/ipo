
import 'package:ipo_tracker/di/injection_container.dart';

import '../../domain/repositories/ipo_detail_repo.dart';
import '../data_source/ipo_detail_data_source.dart';

class IpoDetailRepoImpl implements IpoDetailRepo{

  final get=getIt<IpoDetailDataSource>();

  @override
  Future<Map<String, dynamic>?> callApiIpoDetail(String id) {
    return  get.callApiIpoDetail(id);
  }


}