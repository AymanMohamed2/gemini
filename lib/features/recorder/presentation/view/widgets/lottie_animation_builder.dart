import 'package:chat_gpt/features/recorder/presentation/view/widgets/in_active_gemini..dart';
import 'package:chat_gpt/features/recorder/presentation/view_model/cubit/ask_your_question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationBuilder extends StatelessWidget {
  const LottieAnimationBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AskYourQuestionCubit, AskYourQuestionState>(
      builder: (context, state) {
        return state is AskYourQuestionSpeaking
            ? Lottie.asset('assets/lottie/Animation.json')
            : const InActiveGemini();
      },
    );
  }
}
