import 'package:chat_gpt/core/entities/message_entity.dart';
import 'package:chat_gpt/core/errors/faliure.dart';
import 'package:chat_gpt/core/models/send_message_request_model/send_message_request_model.dart';
import 'package:dartz/dartz.dart';

abstract class RecoderRepository {
  Future<Either<Failure, MessageEntity>> askYourQuestion(
      SendMessageRequestModel sendMessageRequestModel);
}
