import 'package:flutter/material.dart';
import 'package:mehyay/core/theme/palette.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  const CustomTextField(
      {super.key, required this.label, required this.hint, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Palette.sInsets),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Palette.label,
          ),
          const SizedBox(
            height: Palette.sInsets,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
            ),
          ),
        ],
      ),
    );
  }
}
