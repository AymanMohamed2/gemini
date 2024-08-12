import 'package:chat_gpt/core/theme/app_colors.dart';
import 'package:chat_gpt/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: ShapeDecoration(
        image: const DecorationImage(
          image: AssetImage(Assets.chatBot),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        shadows: const [
          BoxShadow(
            color: AppColors.darkGrey,
            blurRadius: 24,
            offset: Offset(4, 4),
            spreadRadius: 0,
          )
        ],
      ),
    );
  }
}
