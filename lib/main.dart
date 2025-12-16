import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_flutter/core/app_initializer.dart';

import 'app.dart';
import 'providers/theme_provider.dart';

Future<void> main() async {
  final prefs = await AppInitializer.init();

  runApp(
    ProviderScope(
      overrides: [prefsProvider.overrideWithValue(prefs)],
      child: const LeoApp(),
    ),
  );
}
