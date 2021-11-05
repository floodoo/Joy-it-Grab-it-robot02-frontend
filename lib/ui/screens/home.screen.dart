import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:robo_app/core/services/services.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = useProvider(themeService).theme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Joy-it-Grab-it-robot02"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('...', style: _theme.data.textTheme.subtitle2),
          ],
        ),
      ),
    );
  }
}
