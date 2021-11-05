import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:robo_app/core/services/services.dart';
import 'package:robo_app/ui/screens/home.screen.dart';

void main() {
  Logger.level = Level.debug;
  runApp(
    const ProviderScope(
      child: MyApp(),
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
      home: const HomeScreen(),
    );
  }
}
