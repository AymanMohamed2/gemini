import 'package:chat_gpt/core/network/api_service.dart';
import 'package:dio/dio.dart';

class DioService extends ApiService {
  final Dio dio;

  DioService(this.dio);
  @override
  Future<Map<String, dynamic>> delete(String url) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> get(String url) async {
    final result = await dio.get(url);
    return result.data;
  }

  @override
  Future<Map<String, dynamic>> put(String url, Map<String, dynamic> body) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> post(
      {required String url,
      required Map<String, dynamic> body,
      Map<String, dynamic>? headers}) async {
    final response = await dio.post(url,
        data: body,
        options:
            Options(headers: headers ?? {"Content-Type": "application/json"}));

    return response.data;
  }
}
