import 'package:chat_gpt/core/theme/app_colors.dart';
import 'package:chat_gpt/features/recorder/presentation/view/widgets/animated_mic.dart';
import 'package:chat_gpt/features/recorder/presentation/view_model/cubit/ask_your_question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedMicBlocBuilder extends StatelessWidget {
  const AnimatedMicBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AskYourQuestionCubit, AskYourQuestionState>(
      builder: (context, state) {
        return AnimatedMic(
          color: state is AskYourQuestionLoading ? AppColors.darkGrey : null,
          onTap: state is AskYourQuestionSpeaking
              ? () {
                  BlocProvider.of<AskYourQuestionCubit>(context).stop();
                }
              : null,
          isAnimated: state is AskYourQuestionRecording ? true : false,
          onLongPress: (state is AskYourQuestionLoading ||
                  state is AskYourQuestionSpeaking)
              ? null
              : () async {
                  await BlocProvider.of<AskYourQuestionCubit>(context)
                      .startRecording();
                },
          child: state is! AskYourQuestionSpeaking
              ? const Icon(Icons.mic)
              : const Icon(Icons.stop),
        );
      },
    );
  }
}
