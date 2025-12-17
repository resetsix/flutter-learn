import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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

  void configureEasyLoading() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = const Color(0x0ff55555)
      ..indicatorColor = Colors.lightBlue
      ..indicatorWidget = const SizedBox(
        width: 40.0,
        height: 40.0,
        child: CircularProgressIndicator(
          strokeWidth: 4.0,
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
        ),
      )
      ..textColor = Colors.white
      ..textAlign = TextAlign.center
      ..fontSize = 15.0
      ..contentPadding = const EdgeInsets.symmetric(
        vertical: 18.0,
        horizontal: 18.0,
      )
      ..textPadding = const EdgeInsets.only(
        top: 10.0,
        left: 15.0,
        right: 15.0,
        bottom: 10.0,
      )
      ..indicatorSize = 40.0
      ..radius = 8.0
      ..maskColor = Colors.black.withValues(alpha: 0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  configureEasyLoading();
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
