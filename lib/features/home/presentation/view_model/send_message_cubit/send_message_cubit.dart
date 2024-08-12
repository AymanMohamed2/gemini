import 'package:bloc/bloc.dart';
import 'package:chat_gpt/features/home/data/models/send_message_request_model/send_message_request_model.dart';
import 'package:chat_gpt/features/home/domain/entities/message_entity.dart';
import 'package:chat_gpt/features/home/domain/usecases/send_message_use_case.dart';
import 'package:meta/meta.dart';

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
}
