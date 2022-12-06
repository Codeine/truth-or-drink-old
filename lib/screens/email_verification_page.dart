import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:truth_or_drink/shared/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  bool isVerified = false;
  Timer? timer;

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } on Exception catch (e) {
      print(e);
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isVerified) {
      timer?.cancel();
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  void initState() {
    super.initState();
    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
          const Duration(seconds: 3), (timer) => checkEmailVerified());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
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
                onPressed: () async {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ),
            const Logo(width: 125.0),
            const SizedBox(height: 74.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: Text(
                'Verify your email address',
                style: defaultFontStyle.copyWith(
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            SpinKitRipple(
              color: betterBlack,
              size: 50.0,
            ),
            const SizedBox(height: 40),
            TextDivider(
              text: Text(
                'WHAT IS THIS?',
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
                'We have sent an email containing a verification link to your email address. You will be automatically redirected upon clicking the verification link.\n\nWe do this in order to make sure that you\'re trying to register with your actual email address. This will be important in case we ever need to recover your account.',
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
