

import 'package:ipo_tracker/di/injection_container.dart';

import '../repositories/sme_repo.dart';



class SmeUseCases{

  final get=getIt<SmeRepo>();

  Future<Map<String, dynamic>?> callApiListedSme(Map<String, dynamic> params){
    return get.callApiListedSme(params);
  }

  Future<Map<String, dynamic>?> callApiCurrentSme(Map<String, dynamic> params){
    return get.callApiCurrentSme(params);
  }


}