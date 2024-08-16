import 'package:chat_gpt/features/recorder/presentation/view/widgets/animated_mic_bloc_builder.dart';
import 'package:chat_gpt/features/recorder/presentation/view/widgets/lottie_animation_builder.dart';
import 'package:flutter/material.dart';

class RecorderViewBody extends StatelessWidget {
  const RecorderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          LottieAnimationBuilder(),
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
