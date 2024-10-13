abstract class SmeRepo{

  Future<Map<String, dynamic>?> callApiListedSme(Map<String, dynamic> params);
  Future<Map<String, dynamic>?> callApiCurrentSme(Map<String, dynamic> params);

}