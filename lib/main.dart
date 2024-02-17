import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehyay/auth/controllers/auth_controller.dart';
import 'package:mehyay/auth/models/user_model.dart';
import 'package:mehyay/auth/views/auth_screen.dart';
import 'package:mehyay/core/theme/theme_data.dart';
import 'package:mehyay/firebase_options.dart';
import 'package:mehyay/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // This widget is the root of your application.
  UserModel? userModel;

  void getData(WidgetRef ref, User data) async {
    userModel = await ref.watch(authControllerProvider).getUserData(data.uid);
    ref.read(userProvider.notifier).update((state) => userModel);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(authStateChangeProvider).whenData((data) {
      if (data != null) {
        getData(ref, data);
      }
    });
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: themeData,
      routerConfig: ref.watch(goRouterProvider),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'SA'),
      ],
      locale: const Locale('ar', 'SA'),
    );
  }
}
