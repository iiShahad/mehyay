import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehyay/auth/controllers/auth_controller.dart';
import 'package:mehyay/auth/views/components/sign_in_form.dart';
import 'package:mehyay/auth/views/components/sign_up_form.dart';
import 'package:mehyay/core/theme/palette.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
            color: Palette.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70),
            ),
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: Palette.lInsets,
                ),
                Text('محياي',
                    style: Palette.t1b.copyWith(color: Palette.white)),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.8,
                  margin: const EdgeInsets.all(Palette.lInsets),
                  decoration: const BoxDecoration(
                    boxShadow: Palette.boxShadow,
                    color: Palette.background,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Palette.lBorderRadius),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Palette.mInsets),
                    child: PageView(
                      controller:
                          ref.watch(authControllerProvider).authPageController,
                      children: const [
                        SignInForm(),
                        SignUpFrom(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
