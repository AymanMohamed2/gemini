import 'package:chat_gpt/core/network/api_service.dart';
import 'package:http/http.dart' as http;

class HttpServices extends ApiService {
  http.Client client = http.Client();
  @override
  Future<Map<String, dynamic>> delete(String url) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> get(String url) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> post(
      {required String url,
      required Map<String, dynamic> body,
      Map<String, dynamic>? headers}) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> put(String url, Map<String, dynamic> body) {
    throw UnimplementedError();
  }
}
