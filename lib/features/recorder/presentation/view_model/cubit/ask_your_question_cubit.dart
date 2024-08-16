import 'package:bloc/bloc.dart';
import 'package:chat_gpt/core/entities/message_entity.dart';
import 'package:chat_gpt/core/models/send_message_request_model/send_message_request_model.dart';
import 'package:chat_gpt/core/services/speech_to_text/stt_service.dart';
import 'package:chat_gpt/core/services/text_to_speach/text_to_speech_service.dart';
import 'package:chat_gpt/features/recorder/domain/usecases/ask_your_question_usecase.dart';
import 'package:meta/meta.dart';

part 'ask_your_question_state.dart';

class AskYourQuestionCubit extends Cubit<AskYourQuestionState> {
  AskYourQuestionCubit(
    this.askYourQuestionUsecase,
    this.textToSpeechService,
    this.speechToTextService,
  ) : super(AskYourQuestionInitial());
  final AskYourQuestionUsecase askYourQuestionUsecase;
  final TextToSpeechService textToSpeechService;
  final SpeechToTextService speechToTextService;
  bool onCanceled = false;
  Future<void> startRecording() async {
    emit(AskYourQuestionRecording());

    await speechToTextService.listen(onResult: (result) async {
      if (result.finalResult) {
        onCanceled = true;
        await askYourQuestion(question: result.recognizedWords);
      }
      onCanceled = false;
    });
    if (onCanceled == false) {
      await Future.delayed(const Duration(seconds: 5), () async {
        emit(AskYourQuestionInitial());
      });
    }
  }

  Future<void> askYourQuestion({required String question}) async {
    emit(AskYourQuestionLoading());
    SendMessageRequestModel questionModel =
        SendMessageRequestModel(message: question);
    final result = await askYourQuestionUsecase.execute(questionModel);
    result.fold((failure) async {
      await speak(failure.errMessage);
    }, (success) async {
      await speak(success.message);
    });
  }

  Future<void> speak(String text) async {
    emit(AskYourQuestionSpeaking());
    await textToSpeechService.speak(text);
    await Future.delayed(const Duration(milliseconds: 200), () async {
      emit(AskYourQuestionInitial());
    });
  }

  Future<void> stop() async {
    await textToSpeechService.stop();
    emit(AskYourQuestionInitial());
  }
}
