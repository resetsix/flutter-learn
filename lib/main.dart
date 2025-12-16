import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_flutter/core/app_initializer.dart';
import 'package:hello_flutter/providers/talker_provider.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

import 'app.dart';
import 'providers/theme_provider.dart';

Future<void> main() async {
  final prefs = await AppInitializer.init();
  final talker = TalkerFlutter.init();

  runApp(
    ProviderScope(
      overrides: [
        prefsProvider.overrideWithValue(prefs),
        talkerProvider.overrideWithValue(talker),
      ],
      observers: [TalkerRiverpodObserver(talker: talker)],
      child: const LeoApp(),
    ),
  );
}
