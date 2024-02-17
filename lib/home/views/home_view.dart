import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehyay/core/theme/palette.dart';
import 'package:mehyay/home/controllers/speech_to_text_controller.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
          child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        margin: const EdgeInsets.all(Palette.lInsets),
        decoration: BoxDecoration(
          boxShadow: Palette.boxShadow,
          color: Palette.background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: IconButton(
              onPressed: () {
                ref.read(speechToTextControllerProvider).listen();
              },
              icon: const Icon(Icons.mic, size: 70)),
        ),
      )),
    );
  }
}
