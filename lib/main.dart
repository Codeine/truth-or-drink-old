import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:truth_or_drink/screens/create_game_page.dart';
import 'package:truth_or_drink/screens/email_verification_page.dart';
import 'package:truth_or_drink/screens/forgotten_password_page.dart';
import 'package:truth_or_drink/screens/game_page.dart';
import 'package:truth_or_drink/screens/login_page.dart';
import 'package:truth_or_drink/screens/main_menu_page.dart';
import 'package:truth_or_drink/screens/manage_question_set_page.dart';
import 'package:truth_or_drink/screens/manage_questions_page.dart';
import 'package:truth_or_drink/screens/registration_page.dart';
import 'package:truth_or_drink/screens/set_display_name_page.dart';
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
        '/': (context) => const RegistrationWrapper(),
        '/login': (context) => const LoginWrapper(),
        '/forgotten-password': (context) => const ForgottenPasswordPage(),
        '/set-display-name': (context) => const SetDisplayNamePage(),
        '/main-menu': (context) => const MainMenuPage(),
        '/create-game': (context) => const CreateGamePage(),
        '/manage-questions': (context) => const ManageQuestionsPage(),
        '/manage-question-set': (context) => const ManageQuestionSetPage(),
        '/game': (context) => const GamePage(),
      },
    );
  }
}

class RegistrationWrapper extends StatelessWidget {
  const RegistrationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (!snapshot.data!.emailVerified) {
            return const EmailVerificationPage();
          } else if (snapshot.data!.displayName == null) {
            return const SetDisplayNamePage();
          } else {
            return const MainMenuPage();
          }
        } else {
          return const RegistrationPage();
        }
      },
    );
  }
}

class LoginWrapper extends StatelessWidget {
  const LoginWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (!snapshot.data!.emailVerified) {
            return const EmailVerificationPage();
          } else if (snapshot.data!.displayName == null) {
            return const SetDisplayNamePage();
          } else {
            return const MainMenuPage();
          }
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
