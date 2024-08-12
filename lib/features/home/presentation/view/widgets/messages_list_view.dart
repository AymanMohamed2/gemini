import 'package:chat_gpt/features/home/presentation/view/widgets/animation_loading.dart';
import 'package:chat_gpt/features/home/presentation/view/widgets/message_item.dart';
import 'package:chat_gpt/features/home/presentation/view/widgets/no_messages_widget.dart';
import 'package:chat_gpt/features/home/presentation/view_model/send_message_cubit/send_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesListView extends StatefulWidget {
  const MessagesListView({
    super.key,
    required this.cubit,
    required this.state,
  });

  final SendMessageCubit cubit;
  final SendMessageState state;

  @override
  State<MessagesListView> createState() => _MessagesListViewState();
}

class _MessagesListViewState extends State<MessagesListView> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.cubit.messages.isEmpty
        ? const NoMessagesWidget()
        : BlocListener<SendMessageCubit, SendMessageState>(
            listener: (context, state) {
              if (state is SendMessageLoading ||
                  state is SendMessageSuccess ||
                  state is SendMessageFailure) {
                scrollToEnd();
              }
            },
            child: Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: buildItem(index),
                  );
                },
                itemCount: widget.state is SendMessageLoading
                    ? widget.cubit.messages.length + 1
                    : widget.cubit.messages.length,
              ),
            ),
          );
  }

  Widget buildItem(int index) {
    if (widget.state is SendMessageLoading) {
      if (index >= widget.cubit.messages.length) {
        return const AnimationLoading();
      } else {
        return MessageItem(message: widget.cubit.messages[index]);
      }
    } else {
      return MessageItem(message: widget.cubit.messages[index]);
    }
  }

  void scrollToEnd() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
