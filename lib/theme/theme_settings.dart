import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme();

  static const Color primaryColor = Color(0XFF31B8CD);

  static const Color white = Colors.white;
  static Color actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);

  static const Color secondColor = Color(0xFF2E3D43);

  static const Color darkColor = Color(0xFF1C1C1D);
  static const Color lightColor = Color(0XFFF1F1F1);

  static const Color successColor = Color(0XFF28a745);
  static const Color errorColor = Color(0XFFdc3545);
  static const Color warningColor = Color(0XFFffc107);
  static const Color infoColor = Color(0XFF17a2b8);

  static const Color textfieldColor = Color(0XFFFFFFFF);
  static const Color pageBackground = Color(0XFF272727);
  static const Color greyColor = Color(0xFF494B5B);

//
  static const double mainRadius = 8.0;

  static List<Color> colorList = [
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.teal,
    Colors.pink,
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.indigo,
    Colors.cyan,
    Colors.brown,
    Colors.lime,
    Colors.blueGrey,
    Colors.lightGreen,
    Colors.deepPurpleAccent,
  ];

  static MaterialColor materialColor = MaterialColor(
    primaryColor.value,
    const <int, Color>{
      50: CustomTheme.primaryColor,
      100: CustomTheme.primaryColor,
      200: CustomTheme.primaryColor,
      300: CustomTheme.primaryColor,
      400: CustomTheme.primaryColor,
      500: CustomTheme.primaryColor,
      600: CustomTheme.primaryColor,
      700: CustomTheme.primaryColor,
      800: CustomTheme.primaryColor,
      900: CustomTheme.primaryColor,
    },
  );
}
