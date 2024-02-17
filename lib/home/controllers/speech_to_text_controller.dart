import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';

final speechToTextControllerProvider = Provider<SpeechToTextController>((ref) {
  return SpeechToTextController();
});

class SpeechToTextController {
  final _speechToText = SpeechToText();
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;

  bool get isListening => _isListening;
  String get text => _text;
  double get confidence => _confidence;

  void listen() async {
    if (!_isListening) {
      bool available = await _speechToText.initialize(
        onStatus: (status) => print('onStatus: $status'),
        onError: (errorNotification) => print('onError: $errorNotification'),
      );
      if (available) {
        _isListening = true;
        _speechToText.listen(
          localeId: 'ar_SA',
          onResult: (result) => {
            _text = result.recognizedWords,
            _confidence = result.confidence,
          },
        );
      }
    } else {
      _isListening = false;
      _speechToText.stop();
    }
    print(_text);
  }
}
