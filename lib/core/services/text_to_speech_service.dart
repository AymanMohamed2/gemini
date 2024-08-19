import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechService {
  final FlutterTts _flutterTts;

  TextToSpeechService(this._flutterTts);
  Future<String> _detectLanguage(String text) async {
    final arabicRegex = RegExp(r'[\u0600-\u06FF]+');
    if (arabicRegex.hasMatch(text)) {
      return "ar-EG";
    } else {
      return "en-US";
    }
  }

  Future<void> speak(String text) async {
    String language = await _detectLanguage(text);
    await _flutterTts.setLanguage(language);
    await _flutterTts.awaitSpeakCompletion(true);
    await _flutterTts.speak(text);
    await _flutterTts.stop();
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }

  Future<void> pause() async {
    await _flutterTts.pause();
  }
}
