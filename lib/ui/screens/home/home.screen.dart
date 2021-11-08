import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:robo_app/core/api/servo.dart';
import 'package:robo_app/core/services/services.dart';
import 'package:robo_app/ui/screens/home/widgets/control_slider.dart';
import 'package:robo_app/ui/screens/settings/settings.screen.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static final routeName = (HomeScreen).toString();

  @override
  Widget build(BuildContext context) {
    final _theme = useProvider(themeService).theme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Joy-it-Grab-it-robot02",
          style: TextStyle(color: _theme.colors.accent),
        ),
        backgroundColor: _theme.colors.primary,
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: _theme.colors.accent,
            ),
            tooltip: "Reset servos",
            onPressed: () {
              for (int i = 0; i < 6; i++) {
                Servo(i).reset();
                sleep(const Duration(milliseconds: 200));
              }
            },
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: _theme.colors.accent,
            ),
            tooltip: "Settings",
            onPressed: () => Navigator.pushNamed(context, SettingsScreen.routeName),
          ),
        ],
      ),
      body: Container(
        color: _theme.colors.accent,
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return ControlSlider(id: index, label: index.toString());
          },
        ),
      ),
    );
  }
}
