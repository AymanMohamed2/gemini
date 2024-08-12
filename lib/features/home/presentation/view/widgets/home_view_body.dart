import 'package:chat_gpt/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:chat_gpt/features/home/presentation/view/widgets/custom_input_form.dart';
import 'package:chat_gpt/features/home/presentation/view/widgets/messages_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
           SizedBox(
            height: 10,
          ),
           CustomAppBar(),
          MessagesListViewBlocBuilder(),
           SizedBox(
            height: 5,
          ),
          CustomInputForm(),
           SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
