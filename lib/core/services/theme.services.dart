import 'package:flutter/material.dart';
import 'package:robo_app/ui/themes/app_theme.dart';

class ThemeService with ChangeNotifier {
  AppTheme _theme = AppTheme.light();

  AppTheme get theme => _theme;

  void toggle() {
    _theme = _theme.mode == ThemeMode.light ? AppTheme.dark() : AppTheme.light();
    notifyListeners();
  }
}
