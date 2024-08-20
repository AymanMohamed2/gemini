abstract class ApiService {
  Future<Map<String, dynamic>> get(String url);
  Future<Map<String, dynamic>> post(
      {required String url,
      required Map<String, dynamic> body,
      Map<String, dynamic>? headers});
  Future<Map<String, dynamic>> put(String url, Map<String, dynamic> body);
  Future<Map<String, dynamic>> delete(String url);
}
