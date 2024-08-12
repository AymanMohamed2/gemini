import 'package:chat_gpt/features/home/data/models/send_message_request_model/send_message_request_model.dart';
import 'package:chat_gpt/features/home/domain/entities/message_entity.dart';

abstract class BaseHomeDataSource {
  Future<MessageEntity> sendMessage(
      SendMessageRequestModel sendMessageRequestModel);
}
