

import 'package:ipo_tracker/di/injection_container.dart';

import '../repositories/ipo_repo.dart';

class IpoUseCases{

  final get=getIt<IpoRepo>();

  Future<Map<String, dynamic>?> callApiListedIpo(Map<String, dynamic> params){
    return get.callApiListedIpo(params);
  }

  Future<Map<String, dynamic>?> callApiCurrentIpo(Map<String, dynamic> params){
    return get.callApiCurrentIpo(params);
  }


}