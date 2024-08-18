import 'dart:async';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextService {
  final SpeechToText speechToText;

  SpeechToTextService(this.speechToText);

  Future<bool> _initialize() async {
    return await speechToText.initialize();
  }

  Future<String?> listen() async {
    if (!await _initialize()) {
      return null;
    }
    final completer = Completer<String?>();
    bool isListening = false;
    // Start listening
    await speechToText.listen(
      onResult: (result) {
        isListening = true;
        if (result.finalResult) {
          isListening = false;
          completer.complete(result.recognizedWords);
        }
      },
      localeId: speechToText.hasError ? 'en-US' : 'ar-EG',
    );
    const timeoutDuration = Duration(seconds: 3);
    Timer(timeoutDuration, () {
      if (!completer.isCompleted) {
        if (!isListening) {
          speechToText.stop();
          completer.complete(null);
        }
      }
    });

    return completer.future;
  }

  bool isNotListening() {
    return speechToText.isNotListening;
  }
}
