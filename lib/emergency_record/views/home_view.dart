import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mehyay/auth/controllers/auth_controller.dart';
import 'package:mehyay/core/constants/assets_constants.dart';
import 'package:mehyay/core/theme/palette.dart';
import 'package:mehyay/emergency_record/controllers/speech_to_text_controller.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    ref.read(speechToTextControllerProvider).initialize();
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  void toggleAnimation() {
    if (_controller.isAnimating) {
      _controller.stop();
      _controller.reset();
      ref.read(speechToTextControllerProvider).stopListening();
    } else {
      _controller.repeat();
      ref.read(speechToTextControllerProvider).listen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الإعلان عن حالة طوارئ"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(authControllerProvider).signOut();
            },
            icon: const Icon(
              Icons.logout,
              color: Palette.red,
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 400,
            height: 400,
            child: GestureDetector(
              onTap: () {
                toggleAnimation();
              },
              child: LottieBuilder.asset(
                animate: false,
                fit: BoxFit.contain,
                AssetsConstants.micPulse,
                controller: _controller,
                onLoaded: (composition) {
                  _controller.duration = composition.duration;
                },
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.mic,
              size: 70,
              color: Palette.white,
            ),
          ),
        ],
      ),
    );
  }
}
