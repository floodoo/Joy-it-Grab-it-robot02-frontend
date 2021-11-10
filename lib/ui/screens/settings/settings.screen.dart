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
        title: Text(
          'Settings',
          style: TextStyle(color: _theme.colors.accent),
        ),
        backgroundColor: _theme.colors.primary,
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
                CustomButtonTile(
                  label: "Teache me!",
                  icon: Icons.school,
                  onPressed: () {},
                ),
                CustomButtonTile(
                  label: "Reset Teaching",
                  icon: Icons.restore,
                  onPressed: () {},
                ),
                CustomButtonTile(
                  label: "Example Sequence",
                  icon: Icons.crop_din,
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    "Other",
                    style: TextStyle(fontSize: 20, color: _theme.colors.primary),
                  ),
                ),
                CustomButtonTile(
                  label: "Sync",
                  icon: Icons.autorenew,
                  onPressed: () {},
                ),
                CustomButtonTile(
                  label: "IP adress",
                  icon: Icons.location_searching,
                  onPressed: () {},
                ),
                CustomButtonTile(
                  label: "Github repo",
                  icon: Icons.info,
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
