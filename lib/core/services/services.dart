import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:robo_app/core/services/teaching.services.dart';
import 'package:robo_app/core/services/theme.services.dart';

final themeService = ChangeNotifierProvider<ThemeService>((ref) => ThemeService());
final teachingService = ChangeNotifierProvider<TeachingService>((ref) => TeachingService());
