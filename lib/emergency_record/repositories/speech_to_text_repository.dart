import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehyay/emergency_record/repositories/emergency_record_repository.dart';
import 'package:speech_to_text/speech_to_text.dart';

final speechToTextRepositoryProvider = Provider<SpeechToTextRepository>((ref) {
  return SpeechToTextRepository(ref: ref);
});

class SpeechToTextRepository {
  final Ref _ref;
  SpeechToTextRepository({required Ref ref}) : _ref = ref;
  final _speechToText = SpeechToText();
  bool isListening = false;
  String text = '';

  Future<void> initialize() async {
    await _speechToText.initialize(
      onError: (val) => print('onError: $val'),
      onStatus: (val) => print('onStatus: $val'),
      finalTimeout: const Duration(minutes: 30),
    );
  }

  void listen() {
    if (!isListening) {
      _speechToText.listen(
        listenFor: const Duration(minutes: 30),
        localeId: 'ar-SA',
        onResult: (result) {
          text = "$text ${result.recognizedWords}";
          if (result.finalResult) {
            stopListening();
          }
        },
      );
      isListening = true;
    } else {
      stopListening();
    }
  }

  void stopListening() {
    if (isListening) {
      _speechToText.stop();
      isListening = false;
      print(text);
    }
  }
}
