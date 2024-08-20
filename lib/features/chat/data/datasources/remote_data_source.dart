import 'package:chat_gpt/core/services/gemini_services.dart';
import 'package:chat_gpt/features/chat/data/datasources/base_home_data_source.dart';
import 'package:chat_gpt/core/models/send_message_request_model/send_message_request_model.dart';
import 'package:chat_gpt/core/entities/message_entity.dart';

class RemoteDataSource extends BaseHomeDataSource {
  final GeminiServices geminiServices;

  RemoteDataSource(this.geminiServices);
  @override
  Future<MessageEntity> sendMessage(
      SendMessageRequestModel sendMessageRequestModel) async {
    return geminiServices.sendMessage(sendMessageRequestModel);
  }
}
