import 'package:chat_gpt/core/utils/service_locator.dart';
import 'package:chat_gpt/features/chat/domain/usecases/send_message_use_case.dart';
import 'package:chat_gpt/features/chat/presentation/view/widgets/home_view_body.dart';
import 'package:chat_gpt/features/chat/presentation/view_model/send_message_cubit/send_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatelessWidget {
  static const String routeName = '/chat_view';
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendMessageCubit(getIt.get<SendMessageUseCase>()),
      child: const Scaffold(
        body: ChatViewBody(),
      ),
    );
  }
}
