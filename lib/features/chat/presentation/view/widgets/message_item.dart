import 'package:chat_gpt/core/theme/app_colors.dart';
import 'package:chat_gpt/core/utils/app_styles.dart';
import 'package:chat_gpt/features/chat/domain/entities/message_entity.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.message,
  });
  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: message.isUserMessage ? 40 : 10,
          right: !message.isUserMessage ? 40 : 10),
      child: Align(
        alignment: message.isUserMessage
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: ShapeDecoration(
            color: message.isUserMessage
                ? AppColors.lightGrey
                : AppColors.darkGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            softWrap: true,
            message.message,
            style: AppStyles.styleRegular14,
          ),
        ),
      ),
    );
  }
}
