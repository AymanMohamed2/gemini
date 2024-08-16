import 'package:chat_gpt/core/network/api_service.dart';
import 'package:chat_gpt/core/network/dio_service.dart';
import 'package:chat_gpt/core/services/gemini_services/gemini_services.dart';
import 'package:chat_gpt/core/services/speech_to_text/stt_service.dart';
import 'package:chat_gpt/core/services/text_to_speach/text_to_speech_service.dart';
import 'package:chat_gpt/features/chat/data/datasources/base_home_data_source.dart';
import 'package:chat_gpt/features/chat/data/datasources/remote_data_source.dart';
import 'package:chat_gpt/features/chat/data/repository/home_repo_impl.dart';
import 'package:chat_gpt/features/chat/domain/repositories/home_repository.dart';
import 'package:chat_gpt/features/chat/domain/usecases/send_message_use_case.dart';
import 'package:chat_gpt/features/recorder/data/datasources/base_recorder_data_source.dart';
import 'package:chat_gpt/features/recorder/data/datasources/recorder_remote_data_source.dart';
import 'package:chat_gpt/features/recorder/data/repository/recorder_repository_impl.dart';
import 'package:chat_gpt/features/recorder/domain/repository/recorder_repo.dart';
import 'package:chat_gpt/features/recorder/domain/usecases/ask_your_question_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get_it/get_it.dart';
import 'package:speech_to_text/speech_to_text.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void setup() {
    getIt.registerSingleton<Dio>(Dio());
    getIt.registerSingleton<ApiService>(DioService(getIt.get<Dio>()));
    getIt.registerSingleton<GeminiServices>(
        GeminiServices(getIt.get<ApiService>()));
    getIt.registerSingleton<BaseHomeDataSource>(
        RemoteDataSource(getIt.get<GeminiServices>()));
    getIt.registerSingleton<HomeRepository>(
        HomeRepoImpl(getIt.get<BaseHomeDataSource>()));
    getIt.registerSingleton<SendMessageUseCase>(
        SendMessageUseCase(getIt.get<HomeRepository>()));
    getIt.registerSingleton<SpeechToText>(SpeechToText());
    getIt.registerSingleton<SpeechToTextService>(
        SpeechToTextService(getIt.get<SpeechToText>()));
    getIt.registerSingleton<BaseRecorderDataSource>(
        RecorderRemoteDataSource(getIt.get<GeminiServices>()));
    getIt.registerSingleton<RecoderRepository>(
        RecorderRepositoryImpl(getIt.get<BaseRecorderDataSource>()));
    getIt.registerSingleton<AskYourQuestionUsecase>(
        AskYourQuestionUsecase(getIt.get<RecoderRepository>()));

    getIt.registerSingleton<FlutterTts>(FlutterTts());
    getIt.registerSingleton<TextToSpeechService>(
        TextToSpeechService(getIt.get<FlutterTts>()));
  }
}
