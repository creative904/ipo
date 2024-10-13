
import 'package:ipo_tracker/di/injection_container.dart';

import '../../domain/repositories/sme_detail_repo.dart';

import '../data_source/sme_detail_data_source.dart';

class SmeDetailRepoImpl implements SmeDetailRepo{

  final get=getIt<SmeDetailDataSource>();

  @override
  Future<Map<String, dynamic>?> callApiSmeDetail(String id) {
    return  get.callApiSmeDetail(id);
  }


}