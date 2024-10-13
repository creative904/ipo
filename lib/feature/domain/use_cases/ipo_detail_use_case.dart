

import 'package:ipo_tracker/di/injection_container.dart';

import '../repositories/ipo_detail_repo.dart';


class IpoDetailUseCases{

  final get=getIt<IpoDetailRepo>();

  Future<Map<String, dynamic>?> callApiIpoDetail(String id){
    return get.callApiIpoDetail(id);
  }




}