import 'package:flutter/material.dart';
import 'package:truth_or_drink/shared/constants.dart';
import 'package:truth_or_drink/shared/features.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    bool ttsEnabled = false;

    void showSettings() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
              child: Column(children: [
                Text(
                  'Settings',
                  style: defaultFontStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Text-to-Speech',
                      style: defaultFontStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Switch(
                      value: ttsEnabled,
                      activeColor: Colors.green,
                      inactiveThumbColor: Colors.red,
                      inactiveTrackColor: Colors.red.withAlpha(100),
                      onChanged: (value) {
                        setState(() {
                          ttsEnabled = value;
                        });
                      },
                    ),
                  ],
                ),
              ]),
            );
          });
    }

    return Base(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    icon: Icon(
                      Icons.close,
                      color: betterBlack,
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/main-menu');
                    },
                    label: Text(
                      'End game',
                      style: defaultFontStyle.copyWith(
                        fontWeight: FontWeight.w700,
                        color: betterBlack,
                      ),
                    ),
                  ),
                  TextButton.icon(
                    icon: Icon(
                      Icons.settings,
                      color: betterBlack,
                    ),
                    onPressed: showSettings,
                    label: Text(
                      'Settings',
                      style: defaultFontStyle.copyWith(
                        fontWeight: FontWeight.w700,
                        color: betterBlack,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Logo(width: 125),
            const SizedBox(height: 90.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'What has been the most embarrassing moment of your life?',
                style: defaultFontStyle.copyWith(
                  fontSize: 33,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 120),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: Text(
                'It\'s player 1\'s turn.',
                style: defaultFontStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: ElevatedButton(
                onPressed: () {
                  notifyNotImplemented(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 156, 39, 176),
                  shape: RoundedRectangleBorder(
                    borderRadius: defaultBorderRadius,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  elevation: 1,
                ),
                child: Text(
                  'TRUTH',
                  style: defaultFontStyle.copyWith(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
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
                  backgroundColor: const Color.fromARGB(255, 244, 67, 64),
                  shape: RoundedRectangleBorder(
                    borderRadius: defaultBorderRadius,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  elevation: 1,
                ),
                child: Text(
                  'DRINK',
                  style: defaultFontStyle.copyWith(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
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
