import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/gemini_logo.svg',
          height: 40,
        )
        // Text(
        //   'New Chat',
        //   style: AppStyles.styleBold20,
        // ),
      ],
    );
  }
}
