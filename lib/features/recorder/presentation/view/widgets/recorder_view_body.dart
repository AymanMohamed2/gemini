import 'package:chat_gpt/features/recorder/presentation/view/widgets/animated_mic_bloc_builder.dart';
import 'package:chat_gpt/features/recorder/presentation/view_model/cubit/ask_your_question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class RecorderViewBody extends StatelessWidget {
  const RecorderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          LottieAnimation(),
          Spacer(),
          AnimatedMicBlocBuilder(),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}

class LottieAnimation extends StatelessWidget {
  const LottieAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AskYourQuestionCubit, AskYourQuestionState>(
      builder: (context, state) {
        return state is AskYourQuestionSpeaking
            ? Lottie.asset('assets/lottie/Animation.json')
            : Column(
                children: [
                  const SizedBox(
                    height: 88,
                  ),
                  Image.asset(
                    'assets/images/simulation.png',
                    height: 230,
                  ),
                  const Text(
                    'Talk to activate\nGemini',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  )
                ],
              );
      },
    );
  }
}
