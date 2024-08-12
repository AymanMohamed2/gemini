import 'package:chat_gpt/core/network/api_service.dart';
import 'package:chat_gpt/core/network/dio_service.dart';
import 'package:chat_gpt/features/chat/data/datasources/base_home_data_source.dart';
import 'package:chat_gpt/features/chat/data/datasources/remote_data_source.dart';
import 'package:chat_gpt/features/chat/data/repository/home_repo_impl.dart';
import 'package:chat_gpt/features/chat/domain/repositories/home_repository.dart';
import 'package:chat_gpt/features/chat/domain/usecases/send_message_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void setup() {
    getIt.registerSingleton<Dio>(Dio());
    getIt.registerSingleton<ApiService>(DioService(getIt.get<Dio>()));
    getIt.registerSingleton<BaseHomeDataSource>(
        RemoteDataSource(getIt.get<ApiService>()));
    getIt.registerSingleton<HomeRepository>(
        HomeRepoImpl(getIt.get<BaseHomeDataSource>()));
    getIt.registerSingleton<SendMessageUseCase>(
        SendMessageUseCase(getIt.get<HomeRepository>()));
  }
}
