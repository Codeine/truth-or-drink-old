import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:truth_or_drink/shared/constants.dart';
import 'package:truth_or_drink/shared/features.dart';

class QuestionSetDropdown extends StatefulWidget {
  const QuestionSetDropdown({super.key});

  @override
  State<QuestionSetDropdown> createState() => _QuestionSetDropdownState();
}

class _QuestionSetDropdownState extends State<QuestionSetDropdown> {
  List<String> questionSets = [
    'Default set',
    'Custom set #1',
    'Custom set #2',
    'Custom set #3'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: questionSets.first,
      onChanged: (value) {},
      items: questionSets.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      icon: Icon(
        Icons.arrow_drop_down,
        color: betterBlack,
      ),
      iconSize: 42,
      underline: const SizedBox(),
    );
  }
}

class CreateGamePage extends StatefulWidget {
  const CreateGamePage({super.key});

  @override
  State<CreateGamePage> createState() => _CreateGamePageState();
}

class _CreateGamePageState extends State<CreateGamePage> {
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
                'Create a new game',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Question set',
                    style: defaultFontStyle.copyWith(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(6)),
                      child: const QuestionSetDropdown(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: Text(
                'Who\'s playing?',
                style: defaultFontStyle.copyWith(
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: FirebaseAuth.instance.currentUser!.displayName,
                  hintStyle: defaultFontStyle.copyWith(
                    color: betterBlack.withAlpha(150),
                    fontSize: 14,
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Player 2\'s name',
                  hintStyle: defaultFontStyle.copyWith(
                    color: betterBlack.withAlpha(150),
                    fontSize: 14,
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add_circle_outline_rounded,
                  size: 40,
                  color: betterBlack,
                ),
                Text(
                  'Add player',
                  style: defaultFontStyle,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/game');
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
                  'Start Game',
                  style: defaultFontStyle.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
