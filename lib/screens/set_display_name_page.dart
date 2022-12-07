import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:truth_or_drink/shared/constants.dart';

class SetDisplayNamePage extends StatefulWidget {
  const SetDisplayNamePage({super.key});

  @override
  State<SetDisplayNamePage> createState() => _SetDisplayNamePageState();
}

class _SetDisplayNamePageState extends State<SetDisplayNamePage> {
  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();

  String? _validateDisplayName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your display name';
    } else if (value.length < 3) {
      return 'Your display name is too short';
    } else if (value.length > 20) {
      return 'Your display name is too long';
    }
    return null;
  }

  void _saveDisplayName() async {
    await FirebaseAuth.instance.currentUser!
        .updateDisplayName(_displayNameController.text.trim());
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  void dispose() {
    _displayNameController.dispose();
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
                'Enter your display name',
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
                  controller: _displayNameController,
                  validator: _validateDisplayName,
                  decoration: InputDecoration(
                    hintText: 'Display name',
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
                  _saveDisplayName();
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
                'WHAT IS THIS FOR?',
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
                'This will be the username you go by.',
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
