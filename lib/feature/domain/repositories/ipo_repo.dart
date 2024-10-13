abstract class IpoRepo{

  Future<Map<String, dynamic>?> callApiListedIpo(Map<String, dynamic> params);
  Future<Map<String, dynamic>?> callApiCurrentIpo(Map<String, dynamic> params);

}