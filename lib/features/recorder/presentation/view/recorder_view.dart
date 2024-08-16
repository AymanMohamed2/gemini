import 'package:chat_gpt/core/services/speech_to_text/stt_service.dart';
import 'package:chat_gpt/core/services/text_to_speach/text_to_speech_service.dart';
import 'package:chat_gpt/core/utils/service_locator.dart';
import 'package:chat_gpt/features/recorder/domain/usecases/ask_your_question_usecase.dart';
import 'package:chat_gpt/features/recorder/presentation/view/widgets/recorder_view_body.dart';
import 'package:chat_gpt/features/recorder/presentation/view_model/cubit/ask_your_question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecorderView extends StatelessWidget {
  const RecorderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AskYourQuestionCubit(
        getIt.get<AskYourQuestionUsecase>(),
        getIt.get<TextToSpeechService>(),
        getIt.get<SpeechToTextService>(),
      ),
      child: const Scaffold(
        body: RecorderViewBody(),
      ),
    );
  }
}
