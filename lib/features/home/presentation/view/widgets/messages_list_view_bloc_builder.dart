import 'package:chat_gpt/features/home/presentation/view/widgets/messages_list_view.dart';
import 'package:chat_gpt/features/home/presentation/view_model/send_message_cubit/send_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesListViewBlocBuilder extends StatelessWidget {
  const MessagesListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SendMessageCubit>(context);
    return BlocBuilder<SendMessageCubit, SendMessageState>(
        builder: (context, state) {
      return MessagesListView(
        cubit: cubit,
        state: state,
      );
    });
  }
}
