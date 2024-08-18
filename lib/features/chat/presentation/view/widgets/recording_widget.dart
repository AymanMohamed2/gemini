import 'package:chat_gpt/core/theme/app_colors.dart';
import 'package:chat_gpt/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RecordingWidget extends StatelessWidget {
  const RecordingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 130),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          color: AppColors.darkGrey, borderRadius: BorderRadius.circular(200)),
      child: Lottie.asset(Assets.lottieMic),
    );
  }
}
