import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehyay/auth/models/user_model.dart';
import 'package:mehyay/auth/repositories/auth_repository.dart';
import 'package:mehyay/core/common/loading_dialog.dart';

final userProvider = StateProvider<UserModel?>((ref) {
  return null;
});

final authControllerProvider = Provider<AuthController>((ref) {
  return AuthController(
      authRepository: ref.watch(authRepositoryProvider), ref: ref);
});

class AuthController {
  final AuthRepository _authRepository;
  final Ref _ref;
  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref;
  final loading = LoadingDialog();

  final PageController authPageController = PageController(initialPage: 0);
  final formKey = GlobalKey<FormState>();

  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpUsernameController =
      TextEditingController();
  final TextEditingController signUpPasswordController =
      TextEditingController();
  final TextEditingController signUpPhoneNumberController =
      TextEditingController();

  final TextEditingController signInEmailController = TextEditingController();
  final TextEditingController signInPasswordController =
      TextEditingController();

  void dispose() {
    authPageController.dispose();
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
    signUpUsernameController.dispose();
  }

  void nextPage(int pageIndex) {
    authPageController.jumpToPage(pageIndex);
  }

  void signUp(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    await loading.show(context);
    final response = await _authRepository.signUp(
      email: signUpEmailController.text,
      password: signUpPasswordController.text,
      name: signUpUsernameController.text,
      phoneNumber: signUpPhoneNumberController.text,
    );
    response.fold(
      (l) {
        //TODO: show error
      },
      (r) {
        _ref.read(userProvider.notifier).update((state) => r);
        loading.hide(context);
      },
    );
  }

  void signIn(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    final response = await _authRepository.signIn(
        email: signInEmailController.text,
        password: signInPasswordController.text);
    response.fold((l) {
      //TODO: show error
    }, (r) {
      _ref.read(userProvider.notifier).update((state) => r);
    });
  }
}
