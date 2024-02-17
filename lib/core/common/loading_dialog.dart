import 'package:flutter/material.dart';
import 'package:mehyay/core/theme/palette.dart';

class LoadingDialog {
  Future<void> show(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  void hide(BuildContext context) {
    Navigator.pop(context);
  }
}
