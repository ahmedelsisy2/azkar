import 'package:flutter/material.dart';

class AppNavigation {
  static void navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}