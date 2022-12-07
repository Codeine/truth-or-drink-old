import 'package:flutter/material.dart';
import 'package:truth_or_drink/shared/constants.dart';
import 'package:truth_or_drink/shared/features.dart';

class ManageQuestionSetPage extends StatefulWidget {
  const ManageQuestionSetPage({super.key});

  @override
  State<ManageQuestionSetPage> createState() => _ManageQuestionSetPageState();
}

class _ManageQuestionSetPageState extends State<ManageQuestionSetPage> {
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
                'Manage \'set name\'',
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
                'Questions',
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
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        color: betterBlack,
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.delete,
                        color: betterBlack,
                      ),
                    ],
                  ),
                  title: Text(
                    'What is your worst nightmare?',
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
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.lightBlue)),
                elevation: 2,
                child: ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        color: betterBlack,
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.delete,
                        color: betterBlack,
                      ),
                    ],
                  ),
                  title: Text(
                    'What\'s your biggest fear?',
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
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.lightBlue)),
                elevation: 2,
                child: ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        color: betterBlack,
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.delete,
                        color: betterBlack,
                      ),
                    ],
                  ),
                  title: Text(
                    'What\'s your biggest secret?',
                    style: defaultFontStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextDivider(
              text: Text(
                'ADD A NEW QUESTION',
                style: defaultFontStyle.copyWith(
                  color: betterBlack.withAlpha(175),
                ),
              ),
              indent: authHorizontalPadding,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Question',
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
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: ElevatedButton(
                onPressed: () {
                  notifyNotImplemented(context);
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
                  'Add Question',
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
