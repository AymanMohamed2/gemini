import 'package:chat_gpt/core/network/api_service.dart';
import 'package:http/http.dart' as http;

class HttpServices extends ApiService {
  http.Client client = http.Client();
  @override
  Future<Map<String, dynamic>> delete(String url) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> get(String url) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> post(
      {required String url,
      required Map<String, dynamic> body,
      Map<String, dynamic>? headers}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> put(String url, Map<String, dynamic> body) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
