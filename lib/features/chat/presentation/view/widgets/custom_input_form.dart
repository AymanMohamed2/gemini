import 'package:chat_gpt/core/services/speech_to_text/stt_service.dart';
import 'package:chat_gpt/core/utils/service_locator.dart';
import 'package:chat_gpt/core/widgets/custom_text_form_field.dart';
import 'package:chat_gpt/core/models/send_message_request_model/send_message_request_model.dart';
import 'package:chat_gpt/features/chat/presentation/view_model/send_message_cubit/send_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_to_text.dart';

class CustomInputForm extends StatefulWidget {
  const CustomInputForm({
    super.key,
  });

  @override
  State<CustomInputForm> createState() => _CustomInputFormState();
}

class _CustomInputFormState extends State<CustomInputForm> {
  stt.SpeechToText speechToText = stt.SpeechToText();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendMessageCubit, SendMessageState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomTextFormField(
              onChanged: (value) {
                setState(() {});
              },
              onSaved: (message) async {
                await sendMessage(context);
              },
              controller: textController,
              isEnabled: state is! SendMessageLoading,
              hintText: '  Ask your question...',
              suffixIcon: IconButton(
                onPressed: state is SendMessageLoading
                    ? null
                    : () async {
                        await recordText(context);
                      },
                icon: textController.text.isNotEmpty
                    ? const Icon(Icons.send)
                    : const Icon(Icons.mic),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> recordText(BuildContext context) async {
    if (textController.text.isNotEmpty) {
      await sendMessage(context);
    } else {
      getIt.get<SpeechToTextService>().listen(onResult: (result) {
        textController.text = result.recognizedWords;
        if (!getIt.get<SpeechToText>().isListening) {
          setState(() {});
        }
      });

      // if (isInitialized) {
      //   await speechToText.listen(
      //     onResult: (result) {},
      //   );
      // }
    }
  }

  Future<void> sendMessage(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      SendMessageRequestModel sendMessageRequestModel =
          SendMessageRequestModel(message: textController.text);
      await BlocProvider.of<SendMessageCubit>(context)
          .sendMessage(sendMessageRequestModel: sendMessageRequestModel);
      textController.clear();
    }
  }
}
