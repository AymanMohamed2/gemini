import 'package:chat_gpt/core/errors/faliure.dart';
import 'package:chat_gpt/features/home/data/models/send_message_request_model/send_message_request_model.dart';
import 'package:chat_gpt/features/home/domain/entities/message_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, MessageEntity>> sendMessage(
      SendMessageRequestModel sendMessageRequestModel);
}
