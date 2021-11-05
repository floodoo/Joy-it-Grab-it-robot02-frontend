import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.background,
    required this.primary,
    required this.accent,
    required this.disabled,
    required this.error,
  });

  final Color background;
  final Color accent;
  final Color primary;
  final Color disabled;
  final Color error;

  factory AppColors.light() {
    return const AppColors(
      background: Colors.white,
      primary: Colors.lightBlue,
      accent: Colors.lightGreen,
      disabled: Colors.black12,
      error: Colors.redAccent,
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      background: Colors.black,
      primary: Colors.cyan,
      accent: Colors.green,
      disabled: Colors.white12,
      error: Colors.red,
    );
  }
}
