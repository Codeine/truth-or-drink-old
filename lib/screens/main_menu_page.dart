import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:truth_or_drink/shared/constants.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

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
              child: TextButton.icon(
                icon: const Icon(
                  Icons.logout,
                  color: Colors.lightBlue,
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                label: Text(
                  'Logout',
                  style: defaultFontStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ),
            const Logo(width: 125.0),
            const SizedBox(height: 74.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: Text(
                'What would you like to do?',
                style: defaultFontStyle.copyWith(
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/create-game');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: defaultBorderRadius,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 1,
                ),
                child: Text(
                  'Create a New Game',
                  style: defaultFontStyle.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/manage-questions');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: defaultBorderRadius,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 1,
                ),
                child: Text(
                  'Edit Questions',
                  style: defaultFontStyle.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextDivider(
              text: Text(
                'TIP',
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
                'Did you know that shaking your phone does the same as pressing the drink button?',
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
