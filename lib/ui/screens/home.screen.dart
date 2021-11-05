import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:robo_app/ui/screens/widgets/control_slider.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Joy-it-Grab-it-robot02"),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return ControlSlider(label: index.toString());
        },
      ),
    );
  }
}
