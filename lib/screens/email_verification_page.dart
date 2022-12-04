import 'package:flutter/material.dart';
import 'package:truth_or_drink/shared/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

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
                  'WHAT IS THIS?',
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
