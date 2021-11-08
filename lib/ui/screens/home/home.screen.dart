import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:robo_app/core/api/servo.dart';
import 'package:robo_app/ui/screens/home/widgets/control_slider.dart';
import 'package:robo_app/ui/screens/settings/settings.screen.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static final routeName = (HomeScreen).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Joy-it-Grab-it-robot02"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: "Reset servos",
            onPressed: () {
              for (int i = 0; i < 6; i++) {
                Servo(i).reset();
                sleep(const Duration(milliseconds: 200));
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: "Settings",
            onPressed: () => Navigator.pushNamed(context, SettingsScreen.routeName),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return ControlSlider(id: index, label: index.toString());
        },
      ),
    );
  }
}
