import 'package:chat_gpt/core/network/dio_service.dart';
import 'package:chat_gpt/core/services/connectivity_service.dart';
import 'package:chat_gpt/core/widgets/custom_text_form_field.dart';
import 'package:chat_gpt/core/models/send_message_request_model/send_message_request_model.dart';
import 'package:chat_gpt/features/chat/presentation/view_model/send_message_cubit/send_message_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class CustomInputForm extends StatefulWidget {
  const CustomInputForm({
    super.key,
    required this.speechToText,
    required this.formKey,
    required this.textController,
  });
  final stt.SpeechToText speechToText;
  final GlobalKey<FormState> formKey;
  final TextEditingController textController;
  @override
  State<CustomInputForm> createState() => _CustomInputFormState();
}

class _CustomInputFormState extends State<CustomInputForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendMessageCubit, SendMessageState>(
      builder: (context, state) {
        return Form(
          key: widget.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomTextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                onSaved: (message) async {
                  await sendMessage(context);
                },
                controller: widget.textController,
                isEnabled: state is! SendMessageLoading,
                hintText: '  Ask your question...',
                suffixIcon: InkWell(
                  onTap: state is SendMessageLoading
                      ? null
                      : () async {
                          if (widget.textController.text.isNotEmpty) {
                            await sendMessage(context);
                          }
                        },
                  onLongPress: state is SendMessageLoading
                      ? null
                      : () async {
                          if (widget.textController.text.isNotEmpty) {
                            await sendMessage(context);
                          } else {
                            print(await ConnectivityService(
                                    Connectivity(), Dio())
                                .ifHasAnInternet());
                          }
                        },
                  child: widget.textController.text.isNotEmpty
                      ? const Icon(Icons.send)
                      : const Icon(Icons.mic),
                )),
          ),
        );
      },
    );
  }

  Future<void> sendMessage(BuildContext context) async {
    if (widget.formKey.currentState!.validate()) {
      String text = widget.textController.text;
      widget.textController.clear();
      SendMessageRequestModel sendMessageRequestModel =
          SendMessageRequestModel(message: text);

      await BlocProvider.of<SendMessageCubit>(context)
          .sendMessage(sendMessageRequestModel: sendMessageRequestModel);
    }
  }
}
