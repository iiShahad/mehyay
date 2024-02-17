import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehyay/auth/controllers/auth_controller.dart';
import 'package:mehyay/core/common/custom_text_field.dart';
import 'package:mehyay/core/theme/palette.dart';

class SignUpFrom extends ConsumerWidget {
  const SignUpFrom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(
          height: Palette.lInsets,
        ),
        const Text(
          'تسجيل مستخدم جديد',
          style: Palette.h1,
        ),
        const SizedBox(
          height: Palette.lInsets,
        ),
        const Form(
          child: Column(
            children: [
              CustomTextField(
                label: "البريد الإلكتروني",
                hint: "name@mail.com",
              ),
              CustomTextField(
                label: "اسم المستخدم",
                hint: "علي عبدالرحمن",
              ),
              CustomTextField(
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
          onPressed: () {
            ref.read(authControllerProvider).signUp(context);
          },
          child: const Text("تسجيل الدخول"),
        ),
        const SizedBox(
          height: Palette.lInsets,
        ),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(text: " هل لديك حساب؟", style: Palette.label),
              TextSpan(
                text: " تسجيل الدخول",
                style: Palette.label.copyWith(
                  color: Palette.primary,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    ref.read(authControllerProvider).nextPage(0);
                  },
              ),
            ],
          ),
        )
      ],
    );
  }
}
