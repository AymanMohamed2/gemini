import 'package:chat_gpt/core/network/api_constance.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class ConnectivityService {
  final Connectivity _connectivity;
  final Dio _dio;

  ConnectivityService(this._connectivity, this._dio);
  Future<bool> checkConnectivity() async {
    List<ConnectivityResult> result = await _connectivity.checkConnectivity();
    if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi)) {
      return true;
    }
    return false;
  }

  Future<bool> ifHasAnInternet() async {
    final result = await _dio.get(ApiConstance.googleBaseUrl);
    if (result.statusCode == 200) {
      return true;
    }
    return false;
  }
}
