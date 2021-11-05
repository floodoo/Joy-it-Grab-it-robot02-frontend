import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:robo_app/core/services/services.dart';
import 'package:robo_app/ui/screens/settings/widgets/custom_button_tile.dart';

class SettingsScreen extends HookWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static final routeName = (SettingsScreen).toString();

  @override
  Widget build(BuildContext context) {
    final _theme = useProvider(themeService).theme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(
        color: _theme.colors.primary,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Teaching",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                CustomButtonTile(
                  label: "Teache me!",
                  icon: const Icon(Icons.school),
                  onPressed: () {},
                ),
                CustomButtonTile(
                  label: "Reset Teaching",
                  icon: const Icon(Icons.restore),
                  onPressed: () {},
                ),
                CustomButtonTile(
                  label: "Example Sequence",
                  icon: const Icon(Icons.crop_din),
                  onPressed: () {},
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Other",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                CustomButtonTile(
                  label: "Sync",
                  icon: const Icon(Icons.autorenew),
                  onPressed: () {},
                ),
                CustomButtonTile(
                  label: "IP adress",
                  icon: const Icon(Icons.location_searching),
                  onPressed: () {},
                ),
                CustomButtonTile(
                  label: "Github repo",
                  icon: const Icon(Icons.info),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
