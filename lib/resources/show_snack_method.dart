import 'package:dental_app/resources/colors.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      backgroundColor: PRIMARY_COLOR_DARK,
      content: Text(message, textAlign: TextAlign.center),
      behavior: SnackBarBehavior.floating,
    ),
  );
}