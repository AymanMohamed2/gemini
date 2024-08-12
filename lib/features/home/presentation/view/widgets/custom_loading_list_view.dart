import 'package:chat_gpt/features/home/presentation/view/widgets/animation_loading.dart';
import 'package:chat_gpt/features/home/presentation/view/widgets/message_item.dart';
import 'package:chat_gpt/features/home/presentation/view_model/send_message_cubit/send_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLoadingListView extends StatefulWidget {
  const CustomLoadingListView({
    super.key,
    required this.cubit,
  });

  final SendMessageCubit cubit;

  @override
  State<CustomLoadingListView> createState() => _CustomLoadingListViewState();
}

class _CustomLoadingListViewState extends State<CustomLoadingListView> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendMessageCubit, SendMessageState>(
      listener: (context, state) {
        scrollToEnd();
      },
      child: Expanded(
        child: ListView.builder(
          controller: scrollController,
          itemBuilder: (context, index) {
            if (index >= widget.cubit.messages.length) {
              return const AnimationLoading();
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: MessageItem(message: widget.cubit.messages[index]),
              );
            }
          },
          itemCount: widget.cubit.messages.length + 1,
        ),
      ),
    );
  }

  void scrollToEnd() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
