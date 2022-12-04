import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:truth_or_drink/screens/create_game_page.dart';
import 'package:truth_or_drink/screens/email_verification_page.dart';
import 'package:truth_or_drink/screens/forgotten_password_page.dart';
import 'package:truth_or_drink/screens/login_page.dart';
import 'package:truth_or_drink/screens/main_menu_page.dart';
import 'package:truth_or_drink/screens/manage_questions_page.dart';
import 'package:truth_or_drink/screens/registration_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Truth or Drink',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegistrationPage(),
        '/forgotten-password': (context) => const ForgottenPasswordPage(),
        '/verify-email': (context) => const EmailVerificationPage(),
        '/main-menu': (context) => const MainMenuPage(),
        '/create-game': (context) => const CreateGamePage(),
        '/manage-questions': (context) => const ManageQuestionsPage(),
      },
    );
  }
}
