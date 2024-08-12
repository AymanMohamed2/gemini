import 'package:chat_gpt/core/network/api_constance.dart';
import 'package:chat_gpt/core/network/api_service.dart';
import 'package:dio/dio.dart';

class DioService extends ApiService {
  final Dio dio;

  DioService(this.dio);
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
  Future<Map<String, dynamic>> put(String url, Map<String, dynamic> body) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> post(
      {required String endPoint,
      required Map<String, dynamic> body,
      Map<String, dynamic>? headers}) async {
    final response = await dio.post(
        "${ApiConstance.baseUrl + endPoint}?key=${ApiConstance.apiKey}",
        data: body,
        options:
            Options(headers: headers ?? {"Content-Type": "application/json"}));

    return response.data;
  }
}
