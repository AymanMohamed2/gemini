import 'package:chat_gpt/core/utils/app_styles.dart';
import 'package:chat_gpt/features/chat/presentation/view/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class NoMessagesWidget extends StatelessWidget {
  const NoMessagesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const WelcomeText(),
              Text(
                'How can i help you Today?',
                style: AppStyles.styleBold35.copyWith(
                  fontSize: 31,
                  color: const Color(0xff444746),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(right: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: const Color(0xff444746).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "A team of reviewers is looking at some saved conversations to improve Google's AI technologies. If you don't want your future conversations to be reviewed, you can turn off 'Gemini app activity'. If this setting is on, we recommend that you avoid entering any information that you would not want to be reviewed or used.",
                  style: AppStyles.styleRegular14.copyWith(
                    color: const Color(0xff889bd5).withOpacity(0.85),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
