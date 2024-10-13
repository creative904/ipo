abstract class MarketRepo{

  Future<Map<String, dynamic>?> callApiDividend(Map<String, dynamic> jsonData);
  Future<Map<String, dynamic>?> callApiSplits(Map<String, dynamic> jsonData);
  Future<Map<String, dynamic>?> callApiBonus(Map<String, dynamic> jsonData);
  Future<Map<String, dynamic>?> callApiRights(Map<String, dynamic> jsonData);

}