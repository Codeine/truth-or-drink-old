import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:truth_or_drink/shared/constants.dart';
import 'package:truth_or_drink/shared/features.dart';

class ForgottenPasswordPage extends StatefulWidget {
  const ForgottenPasswordPage({super.key});

  @override
  State<ForgottenPasswordPage> createState() => _ForgottenPasswordPageState();
}

class _ForgottenPasswordPageState extends State<ForgottenPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your email address';
    } else if (!isValidEmail(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  void _resetPassword() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailController.text.trim());
    if (!mounted) return;
    notifyUser(context, 'Email sent.');
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Base(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Logo(width: 125.0),
            const SizedBox(height: 74.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: Text(
                'Forgotten your password?',
                style: defaultFontStyle.copyWith(
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _emailController,
                  validator: _validateEmail,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: defaultFontStyle.copyWith(
                      color: betterBlack.withAlpha(150),
                      fontSize: 14,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  _resetPassword();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: defaultBorderRadius,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  elevation: 1,
                ),
                child: Text(
                  'Continue',
                  style: defaultFontStyle.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextDivider(
              text: Text(
                'HOW DOES THIS WORK?',
                style: defaultFontStyle.copyWith(
                  color: betterBlack.withAlpha(175),
                ),
              ),
              indent: authHorizontalPadding,
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: Text(
                'In case we find your account, we will send a password reset link to the email address you provided.',
                style: defaultFontStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
