

import 'package:ipo_tracker/di/injection_container.dart';


import '../repositories/market_repo.dart';

class MarketUseCases{

  final get=getIt<MarketRepo>();

  Future<Map<String, dynamic>?> callApiDividend(Map<String, dynamic> params){
    return get.callApiDividend(params);
  }

  Future<Map<String, dynamic>?> callApiBonus(Map<String, dynamic> params){
    return get.callApiBonus(params);
  }

  Future<Map<String, dynamic>?> callApiRights(Map<String, dynamic> params){
    return get.callApiRights(params);
  }

  Future<Map<String, dynamic>?> callApiSplits(Map<String, dynamic> params){
    return get.callApiSplits(params);
  }


}