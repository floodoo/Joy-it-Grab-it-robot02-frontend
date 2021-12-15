import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:robo_app/core/services/services.dart';
import 'package:robo_app/ui/screens/home/home.screen.dart';
import 'package:robo_app/ui/screens/settings/settings.screen.dart';

void main() {
  Logger.level = Level.debug;
  runApp(
    ProviderScope(
      child: Phoenix(
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = useProvider(themeService).theme;
    return MaterialApp(
      title: "Joy-it-Grab-it-robot02",
      theme: _theme.data,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
      },
    );
  }
}
