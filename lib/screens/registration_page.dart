import 'package:flutter/material.dart';
import 'package:truth_or_drink/shared/constants.dart';
import 'package:truth_or_drink/shared/features.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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
                'Create an account',
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
                        suffixIcon: const Icon(Icons.visibility),
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
                  print("Passed: registration");
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
            const SizedBox(height: 30.0),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    indent: authHorizontalPadding,
                    endIndent: 10.0,
                    thickness: 1.0,
                    color: Color.fromARGB(100, 45, 51, 58),
                  ),
                ),
                Text(
                  'OR',
                  style: defaultFontStyle.copyWith(
                    fontSize: 14,
                    color: Color.fromARGB(175, 45, 51, 58),
                  ),
                ),
                Expanded(
                  child: Divider(
                    indent: 10.0,
                    endIndent: authHorizontalPadding,
                    thickness: 1,
                    color: Color.fromARGB(100, 45, 51, 58),
                  ),
                ),
              ],
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
                  'Sign up with Google',
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
                  'Sign up with Facebook',
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
                  'Already have an account?',
                  style: defaultFontStyle,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Text(
                    ' Sign in.',
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
