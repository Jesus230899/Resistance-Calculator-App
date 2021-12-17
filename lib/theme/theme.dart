import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xff3b4663);
  static const accentColor = Color(0xff9659fc);
  static const backgroundColor = Color(0xfff7f7f7);
}

final theme = ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: AppColors.accentColor),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme:
      ThemeData().colorScheme.copyWith(primary: AppColors.primaryColor),
  splashColor: Colors.white,
);
