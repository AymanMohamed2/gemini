import 'package:chat_gpt/core/theme/app_theme.dart';
import 'package:chat_gpt/core/utils/app_routes.dart';
import 'package:chat_gpt/core/utils/service_locator.dart';
import 'package:chat_gpt/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ChatGptApp extends StatefulWidget {
  const ChatGptApp({super.key});

  @override
  State<ChatGptApp> createState() => _ChatGptAppState();
}

class _ChatGptAppState extends State<ChatGptApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    getIt.get<FlutterTts>().stop(); // Stop TTS when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      getIt.get<FlutterTts>().stop(); // Stop TTS when app goes into background
    }
  }
}
