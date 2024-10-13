

import 'package:ipo_tracker/di/injection_container.dart';

import '../repositories/sme_detail_repo.dart';


class SmeDetailUseCases{

  final get=getIt<SmeDetailRepo>();

  Future<Map<String, dynamic>?> callApiSmeDetail(String id){
    return get.callApiSmeDetail(id);
  }




}