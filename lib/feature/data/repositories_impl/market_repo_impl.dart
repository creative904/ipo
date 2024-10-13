
import 'dart:convert';

import 'package:ipo_tracker/di/injection_container.dart';

import '../../domain/repositories/ipo_detail_repo.dart';
import '../../domain/repositories/market_repo.dart';
import '../data_source/ipo_detail_data_source.dart';
import '../data_source/market_data_source.dart';

class MarketRepoImpl implements MarketRepo{

  final get=getIt<MarketDataSource>();

  @override
  Future<Map<String, dynamic>?> callApiDividend(Map<String, dynamic> jsonData) {
    return  get.callApiDividend(jsonData);
  }

  @override
  Future<Map<String, dynamic>?> callApiSplits(Map<String, dynamic> jsonData) {
    return  get.callApiSplits(jsonData);
  }
  @override
  Future<Map<String, dynamic>?> callApiBonus(Map<String, dynamic> jsonData) {
    return  get.callApiBonus(jsonData);
  }
  @override
  Future<Map<String, dynamic>?> callApiRights(Map<String, dynamic> jsonData) {
    return  get.callApiRights(jsonData);
  }



}