import 'package:chat_gpt/core/errors/faliure.dart';
import 'package:dio/dio.dart';

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout With ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout With ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout With ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);

      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection 🌐');

      default:
        return ServerFailure('Ops There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic json) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(json['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try again');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, Please try again');
    } else {
      return ServerFailure('Oops something went wrong, Please try again');
    }
  }
}
