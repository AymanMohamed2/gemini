import 'package:chat_gpt/core/theme/app_colors.dart';
import 'package:chat_gpt/features/home/presentation/view/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AnimationLoading extends StatelessWidget {
  const AnimationLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            const CustomCircleAvatar(),
            const SizedBox(
              width: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: ShapeDecoration(
                color: AppColors.darkGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: LoadingAnimationWidget.horizontalRotatingDots(
                  color: Colors.white, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
