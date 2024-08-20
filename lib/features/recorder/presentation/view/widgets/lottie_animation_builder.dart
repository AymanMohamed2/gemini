import 'package:chat_gpt/core/utils/assets.dart';
import 'package:chat_gpt/features/recorder/presentation/view/widgets/in_active_gemini.dart';
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
        if (state is AskYourQuestionSpeaking) {
          return Lottie.asset(Assets.lottieTalking);
        } else if (state is AskYourQuestionLoading) {
          return Padding(
            padding: const EdgeInsets.only(top: 90),
            child: SizedBox(
                height: 280, child: Lottie.asset(Assets.lottieLoading)),
          );
        } else {
          return const InActiveGemini();
        }
      },
    );
  }
}
