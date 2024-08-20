import 'package:chat_gpt/core/entities/message_entity.dart';
import 'package:chat_gpt/core/models/send_message_request_model/send_message_request_model.dart';
import 'package:chat_gpt/core/services/gemini_services.dart';
import 'package:chat_gpt/features/recorder/data/datasources/base_recorder_data_source.dart';

class RecorderRemoteDataSource extends BaseRecorderDataSource {
  final GeminiServices geminiServices;

  RecorderRemoteDataSource(this.geminiServices);
  @override
  Future<MessageEntity> askYourQuestion(
      SendMessageRequestModel sendMessageRequestModel) async {
    return await geminiServices.sendMessage(sendMessageRequestModel);
  }
}
