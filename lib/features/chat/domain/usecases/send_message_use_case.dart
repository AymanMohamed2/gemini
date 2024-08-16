import 'package:chat_gpt/core/errors/faliure.dart';
import 'package:chat_gpt/core/models/send_message_request_model/send_message_request_model.dart';
import 'package:chat_gpt/core/entities/message_entity.dart';
import 'package:chat_gpt/features/chat/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class SendMessageUseCase {
  final HomeRepository homeRepository;

  SendMessageUseCase(this.homeRepository);

  Future<Either<Failure, MessageEntity>> execute(
      SendMessageRequestModel sendMessageRequestModel) {
    return homeRepository.sendMessage(sendMessageRequestModel);
  }
}
