import 'package:chat_gpt/core/entities/message_entity.dart';
import 'package:chat_gpt/core/models/send_message_request_model/send_message_request_model.dart';

abstract class BaseRecorderDataSource {
  Future<MessageEntity> askYourQuestion(
      SendMessageRequestModel sendMessageRequestModel);
}
