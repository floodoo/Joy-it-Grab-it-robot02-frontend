import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:robo_app/core/services/services.dart';
import 'package:robo_app/ui/screens/settings/widgets/custom_button_tile.dart';
import 'package:robo_app/ui/screens/settings/widgets/url_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends HookWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static final routeName = (SettingsScreen).toString();

  @override
  Widget build(BuildContext context) {
    final _theme = useProvider(themeService).theme;
    final _teaching = useProvider(teachingService);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: _theme.colors.accent),
        ),
        backgroundColor: _theme.colors.primary,
        iconTheme: IconThemeData(color: _theme.colors.accent),
      ),
      body: Container(
        color: _theme.colors.accent,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    "Teaching",
                    style: TextStyle(fontSize: 20, color: _theme.colors.primary),
                  ),
                ),
                // Switch to enable teaching mode. When enabled, change some slider values and press the button again
                //to send the new value to the robot. You can teach him as many sequences as you want.
                CustomButtonTile(
                  label: (_teaching.isTeaching) ? "Stop teaching" : "Start teaching",
                  icon: Icons.school,
                  onPressed: () {
                    if (_teaching.isTeaching) {
                      _teaching.teaching();
                    } else {
                      _teaching.toggleTeaching();
                    }
                  },
                ),
                CustomButtonTile(
                  label: "Reset teaching",
                  icon: Icons.restore,
                  onPressed: () => _teaching.reset(),
                ),
                // Run an example sequence, that resets every slider to their default value and then
                // picks up a tiny object and moves it to the other side.
                // Example video: https://youtu.be/DA7x8Jc-tic?t=34
                CustomButtonTile(
                  label: "Example sequence",
                  icon: Icons.crop_din,
                  onPressed: () => _teaching.exampleSequence(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    "Other",
                    style: TextStyle(fontSize: 20, color: _theme.colors.primary),
                  ),
                ),
                CustomButtonTile(
                  label: "Change API endpoint",
                  icon: Icons.location_searching,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const URLDialog();
                      },
                    );
                  },
                ),
                CustomButtonTile(
                  label: "Github repo",
                  icon: Icons.info,
                  onPressed: () async {
                    await launch(
                      "https://github.com/floodoo/Joy-it-Grab-it-robot02-frontend",
                    );
                  },
                ),
                CustomButtonTile(
                  label: "Github repo backend",
                  icon: Icons.info,
                  onPressed: () async {
                    await launch(
                      "https://github.com/floodoo/Joy-it-Grab-it-robot02-backend",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
