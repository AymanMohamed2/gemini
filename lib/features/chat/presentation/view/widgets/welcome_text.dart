import 'package:chat_gpt/core/utils/app_styles.dart';
import 'package:chat_gpt/features/chat/presentation/view/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const GradientText(
      text: 'Welcome to Gemini',
      style: AppStyles.styleBold35,
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.red],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
}
