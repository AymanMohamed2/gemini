import 'package:chat_gpt/core/theme/app_theme.dart';
import 'package:chat_gpt/core/utils/app_routes.dart';
import 'package:chat_gpt/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

class ChatGptApp extends StatelessWidget {
  const ChatGptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
