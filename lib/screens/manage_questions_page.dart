import 'package:flutter/material.dart';
import 'package:truth_or_drink/shared/constants.dart';
import 'package:truth_or_drink/shared/features.dart';

class ManageQuestionsPage extends StatefulWidget {
  const ManageQuestionsPage({super.key});

  @override
  State<ManageQuestionsPage> createState() => _ManageQuestionsPageState();
}

class _ManageQuestionsPageState extends State<ManageQuestionsPage> {
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
                'Manage question sets',
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
              child: Text(
                'Your sets',
                style: defaultFontStyle.copyWith(
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: authHorizontalPadding - 5),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.lightBlue)),
                elevation: 2,
                child: ListTile(
                  trailing: Icon(
                    Icons.lock,
                    color: betterBlack,
                  ),
                  title: Text(
                    'Default questions',
                    style: defaultFontStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: authHorizontalPadding - 5),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/manage-question-set');
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.lightBlue)),
                  elevation: 2,
                  child: ListTile(
                    trailing: Icon(
                      Icons.delete,
                      color: betterBlack,
                    ),
                    title: Text(
                      'Family friendly',
                      style: defaultFontStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: authHorizontalPadding - 5),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/manage-question-set');
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.lightBlue)),
                  elevation: 2,
                  child: ListTile(
                    trailing: Icon(
                      Icons.delete,
                      color: betterBlack,
                    ),
                    title: Text(
                      'Friends',
                      style: defaultFontStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add_circle_outline_rounded,
                  size: 40,
                  color: betterBlack,
                ),
                Text(
                  'Add set',
                  style: defaultFontStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
