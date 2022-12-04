// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Color logoBlue = Color.fromARGB(255, 91, 118, 182);
Color betterBlack = Color.fromARGB(255, 45, 51, 58);
Color facebookBlue = Color.fromARGB(255, 66, 103, 178);

BorderRadius defaultBorderRadius = BorderRadius.circular(6);

double authHorizontalPadding = 40;

TextStyle defaultFontStyle = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 14,
  color: betterBlack,
);

class Base extends StatefulWidget {
  const Base({super.key, required this.child});
  final Widget child;

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: widget.child,
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key, required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/cocktail.png',
          width: width,
        ),
        Text(
          'TRUTH OR DRINK',
          style: defaultFontStyle.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: logoBlue,
          ),
        )
      ],
    );
  }
}

class TextDivider extends StatelessWidget {
  const TextDivider({
    super.key,
    required this.text,
    this.thickness = 1,
    this.indent = 10,
    this.endIndent = 10,
  });
  final Widget text;
  final double thickness;
  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            indent: indent,
            endIndent: endIndent,
            thickness: thickness,
            color: Color.fromARGB(100, 45, 51, 58),
          ),
        ),
        text,
        Expanded(
          child: Divider(
            indent: endIndent,
            endIndent: indent,
            thickness: thickness,
            color: Color.fromARGB(100, 45, 51, 58),
          ),
        ),
      ],
    );
  }
}
