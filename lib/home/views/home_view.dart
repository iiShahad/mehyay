import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mehyay/core/theme/palette.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {}, icon: const Icon(Icons.mic, size: 70)),
        ),
      )),
    );
  }
}
