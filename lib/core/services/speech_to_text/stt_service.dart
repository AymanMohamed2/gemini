import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextService {
  final SpeechToText speechToText;

  SpeechToTextService(this.speechToText);

  Future<bool> _initialize() async {
    return await speechToText.initialize();
  }

  Future<void> listen(
      {required Function(SpeechRecognitionResult)? onResult}) async {
    if (await _initialize()) {
      await speechToText.listen(
          onResult: onResult,
          localeId: speechToText.hasError ? 'en-US' : 'ar-EG');
    }
  }

  bool isNotListening() {
    return speechToText.isNotListening;
  }
}
