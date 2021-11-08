import 'package:flutter/material.dart';
import 'package:robo_app/ui/themes/app_colors.dart';
import 'package:robo_app/ui/themes/dark.theme.dart';
import 'package:robo_app/ui/themes/light.theme.dart';


class AppTheme {
  AppTheme({required this.data, required this.mode, required this.colors});

  final ThemeData data;
  final ThemeMode mode;
  final AppColors colors;

  factory AppTheme.light() => AppTheme(data: lightTheme, mode: ThemeMode.light, colors: AppColors.light());

  factory AppTheme.dark() => AppTheme(data: darkTheme, mode: ThemeMode.dark, colors: AppColors.dark());
}
