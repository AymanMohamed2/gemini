import 'package:chat_gpt/app.dart';
import 'package:chat_gpt/core/utils/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.setup();
  runApp(const ChatGptApp());
}
