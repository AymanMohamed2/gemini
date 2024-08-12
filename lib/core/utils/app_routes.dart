import 'package:chat_gpt/features/home/presentation/view/home_view.dart';
import 'package:chat_gpt/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case HomeView.routeName:
        return MaterialPageRoute(builder: (context) => const HomeView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
