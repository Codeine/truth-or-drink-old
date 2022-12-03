import 'package:flutter/material.dart';
import 'package:truth_or_drink/shared/constants.dart';

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
