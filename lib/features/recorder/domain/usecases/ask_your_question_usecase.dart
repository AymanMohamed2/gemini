import 'package:chat_gpt/core/entities/message_entity.dart';
import 'package:chat_gpt/core/errors/faliure.dart';
import 'package:chat_gpt/core/models/send_message_request_model/send_message_request_model.dart';
import 'package:chat_gpt/features/recorder/domain/repository/recorder_repo.dart';
import 'package:dartz/dartz.dart';

class AskYourQuestionUsecase {
  final RecoderRepository recoderRepository;

  AskYourQuestionUsecase(this.recoderRepository);
  Future<Either<Failure, MessageEntity>> execute(
      SendMessageRequestModel sendMessageRequestModel) async {
    return await recoderRepository.askYourQuestion(sendMessageRequestModel);
  }
}
