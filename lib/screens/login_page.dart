import 'package:flutter/material.dart';
import 'package:truth_or_drink/shared/constants.dart';
import 'package:truth_or_drink/shared/features.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Base(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Logo(width: 125.0),
            const SizedBox(height: 74.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: Text(
                'Welcome back',
                style: defaultFontStyle.copyWith(
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: authHorizontalPadding),
                    child: TextFormField(
                      validator: validateEmail,
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
                  const SizedBox(height: 10),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: authHorizontalPadding),
                    child: TextFormField(
                      validator: validatePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: defaultFontStyle.copyWith(
                          color: betterBlack.withAlpha(150),
                          fontSize: 14,
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState == null) return;
                  if (!_formKey.currentState!.validate()) return;
                  print("Passed: login");
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
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 4.0, right: authHorizontalPadding),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/forgotten-password');
                  },
                  child: Text(
                    'Forgot your password?',
                    style: defaultFontStyle.copyWith(
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextDivider(
              text: Text(
                'OR',
                style: defaultFontStyle.copyWith(
                  color: betterBlack.withAlpha(175),
                ),
              ),
              indent: authHorizontalPadding,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: OutlinedButton.icon(
                onPressed: () {
                  notifyNotImplemented(context);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                icon: Image.asset(
                  'assets/google.png',
                  width: 20,
                ),
                label: Text(
                  'Sign in with Google',
                  style: defaultFontStyle.copyWith(
                    color: betterBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: TextButton.icon(
                onPressed: () {
                  notifyNotImplemented(context);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  backgroundColor: facebookBlue,
                ),
                icon: Image.asset(
                  'assets/facebook.png',
                  width: 20,
                ),
                label: Text(
                  'Sign in with Facebook',
                  style: defaultFontStyle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: defaultFontStyle,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  child: Text(
                    ' Register.',
                    style: defaultFontStyle.copyWith(color: Colors.lightBlue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
