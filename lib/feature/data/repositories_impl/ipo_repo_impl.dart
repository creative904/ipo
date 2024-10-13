
import 'package:ipo_tracker/di/injection_container.dart';

import '../../domain/repositories/ipo_repo.dart';
import '../data_source/ipo_data_source.dart';

class IpoRepoImpl implements IpoRepo{

  final get=getIt<IpoDataSource>();

  @override
  Future<Map<String, dynamic>?> callApiListedIpo(Map<String, dynamic> params) {
    return  get.callApiListedIpo(params);
  }

  @override
  Future<Map<String, dynamic>?> callApiCurrentIpo(Map<String, dynamic> params) {
    return  get.callApiCurrentIpo(params);
  }

}