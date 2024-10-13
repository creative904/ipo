
import 'package:ipo_tracker/di/injection_container.dart';

import '../../domain/repositories/sme_repo.dart';
import '../data_source/sme_data_source.dart';

class SmeRepoImpl implements SmeRepo{

  final get=getIt<SmeDataSource>();

  @override
  Future<Map<String, dynamic>?> callApiListedSme(Map<String, dynamic> params) {
    return  get.callApiListedSme(params);
  }

  @override
  Future<Map<String, dynamic>?> callApiCurrentSme(Map<String, dynamic> params) {
    return  get.callApiCurrentSme(params);
  }

}