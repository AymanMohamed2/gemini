import 'package:bloc/bloc.dart';
import 'package:chat_gpt/core/entities/message_entity.dart';
import 'package:chat_gpt/core/models/send_message_request_model/send_message_request_model.dart';
import 'package:chat_gpt/core/services/speech_to_text/stt_service.dart';
import 'package:chat_gpt/core/utils/service_locator.dart';
import 'package:chat_gpt/features/chat/domain/usecases/send_message_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit(this.sendMessageUseCase) : super(SendMessageInitial());
  final SendMessageUseCase sendMessageUseCase;
  List<MessageEntity> messages = [];

  Future<void> sendMessage(
      {required SendMessageRequestModel sendMessageRequestModel}) async {
    messages.add(MessageEntity(
        message: sendMessageRequestModel.message, isUserMessage: true));
    emit(SendMessageLoading());
    final result = await sendMessageUseCase.execute(sendMessageRequestModel);
    result.fold(
      (failure) {
        messages.add(
            MessageEntity(message: failure.errMessage, isUserMessage: false));
        emit(SendMessageFailure());
      },
      (success) {
        messages
            .add(MessageEntity(message: success.message, isUserMessage: false));
        emit(SendMessageSuccess());
      },
    );
  }

  Future<void> recordText(BuildContext context,
      {required TextEditingController textController}) async {
    emit(SendMessageRecording());
    String? text = await getIt.get<SpeechToTextService>().listen();

    if (text != null) {
      textController.text = text;
      if (!getIt.get<SpeechToText>().isListening) {
        emit(SendMessageInitial());
      }
    }
    emit(SendMessageInitial());
  }
}
