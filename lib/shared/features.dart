import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:truth_or_drink/shared/constants.dart';

Future signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } on Exception catch (e) {
    print(e);
  }
}

void notifyUser(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(
          text,
          style: defaultFontStyle.copyWith(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.lightBlue),
  );
}

bool canShowSnackbar = true;
void notifyNotImplemented(context) {
  if (canShowSnackbar) {
    canShowSnackbar = false;
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
              content: Text(
                'Sorry, we have yet to implement this feature.',
                style: defaultFontStyle.copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.lightBlue),
        )
        .closed
        .then((reason) => canShowSnackbar = true);
  }
}

bool isValidEmail(String email) {
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter your email address';
  } else if (!isValidEmail(value)) {
    return 'Invalid email format';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter your password';
  } else if (value.length < 4) {
    return 'Password is too short';
  }
  return null;
}
