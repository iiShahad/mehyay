import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehyay/emergency_record/repositories/speech_to_text_repository.dart';

final emergencyRecordStateControllerProvider =
    Provider<EmergencyRecordStateController>((ref) {
  return EmergencyRecordStateController(ref: ref);
});

class EmergencyRecordStateController {
  final Ref _ref;
  EmergencyRecordStateController({required Ref ref}) : _ref = ref;
  late AnimationController _controller;

  AnimationController get controller => _controller;

  void init(TickerProvider vsync) {
    _ref.read(speechToTextRepositoryProvider).initialize();
    _controller = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 1),
    );
  }

  void toggleAnimation() {
    if (_controller.isAnimating) {
      _controller.stop();
      _controller.reset();
      _ref.read(speechToTextRepositoryProvider).stopListening();
    } else {
      _controller.repeat();
      _ref.read(speechToTextRepositoryProvider).listen();
    }
  }

  void dispose() {
    _controller.dispose();
  }
}
