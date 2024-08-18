import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class AnimatedMic extends StatelessWidget {
  const AnimatedMic({
    super.key,
    this.isAnimated = false,
    this.onLongPress,
    required this.child,
    this.onTap,
    this.color,
  });

  final Color? color;
  final Widget child;
  final bool isAnimated;
  final void Function()? onLongPress;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      startDelay: const Duration(milliseconds: 1000),
      glowColor: Colors.white,
      glowShape: BoxShape.circle,
      animate: isAnimated,
      curve: Curves.fastOutSlowIn,
      child: Material(
        elevation: 8.0,
        shape: const CircleBorder(),
        color: Colors.transparent,
        child: GestureDetector(
          onTap: onTap,
          onLongPress: onLongPress,
          child: CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
