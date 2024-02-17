import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehyay/auth/controllers/auth_controller.dart';
import 'package:mehyay/core/common/custom_text_field.dart';
import 'package:mehyay/core/theme/palette.dart';

class SignInForm extends ConsumerWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(
          height: Palette.lInsets,
        ),
        const Text(
          'تسجيل الدخول',
          style: Palette.h1,
        ),
        const SizedBox(
          height: Palette.lInsets,
        ),
        Form(
          child: Column(
            children: [
              CustomTextField(
                controller:
                    ref.watch(authControllerProvider).signInEmailController,
                label: "البريد الإلكتروني",
                hint: "name@mail.com",
              ),
              CustomTextField(
                controller:
                    ref.watch(authControllerProvider).signInPasswordController,
                label: "كلمة المرور",
                hint: "*******",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: Palette.lInsets,
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text("تسجيل الدخول"),
        ),
        const SizedBox(
          height: Palette.lInsets,
        ),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(text: " ليس لديك حساب؟", style: Palette.label),
              TextSpan(
                text: " تسجيل حساب جديد",
                style: Palette.label.copyWith(
                  color: Palette.primary,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    ref.read(authControllerProvider).nextPage(1);
                  },
              ),
            ],
          ),
        )
      ],
    );
  }
}
