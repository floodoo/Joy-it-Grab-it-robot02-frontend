import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.background,
    required this.primary,
    required this.accent,
  });

  final Color background;
  final Color accent;
  final Color primary;

  factory AppColors.light() {
    return const AppColors(
      background: Colors.white,
      primary: Colors.orange,
      accent: Colors.black87,
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      background: Colors.black,
      primary: Colors.cyan,
      accent: Colors.green,
    );
  }
}
