import 'package:chat_gpt/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.onChanged,
      this.isEnabled,
      this.controller,
      this.onSaved});
  final String hintText;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final bool? isEnabled;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSaved,
      controller: controller,
      enabled: isEnabled,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: suffixIcon,
        ),
        filled: true,
        fillColor: AppColors.darkGrey,
        hintText: hintText,
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
        border: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() =>
      OutlineInputBorder(borderRadius: BorderRadius.circular(25));
}
