import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mehyay/core/constants/assets_constants.dart';
import 'package:mehyay/core/theme/palette.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with TickerProviderStateMixin {
  late final _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: LottieBuilder.asset(
          AssetsConstants.loading,
          controller: _controller,
          fit: BoxFit.cover,
          animate: true,
        ),
      ),
    );
  }
}

//------------------------LoadingDialog------------------------

class LoadingDialog {
  Future<void> show(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          child: Center(child: Loading()),
        );
      },
    );
  }

  void hide(BuildContext context) {
    Navigator.pop(context);
  }
}
