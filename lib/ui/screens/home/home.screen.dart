import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:robo_app/core/api/servo.dart';
import 'package:robo_app/core/services/services.dart';
import 'package:robo_app/ui/screens/home/widgets/control_slider.dart';
import 'package:robo_app/ui/screens/settings/settings.screen.dart';

class HomeScreen extends StatefulHookWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static final routeName = (HomeScreen).toString();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _theme = useProvider(themeService).theme;
    final _teaching = useProvider(teachingService);

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
              Icons.play_arrow,
              color: _theme.colors.accent,
            ),
            tooltip: "Run teach mode",
            onPressed: () {
              _teaching.run();
            },
          ),

          // Reset each servo to the default position
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: _theme.colors.accent,
            ),
            tooltip: "Reset servos",
            onPressed: () {
              for (int i = 0; i < 6; i++) {
                Servo(i).resetPos();
              }
              Phoenix.rebirth(context);
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

        // Build for each servo a slider (if you have more than 6 servos, you can increase the itemCount number)
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
