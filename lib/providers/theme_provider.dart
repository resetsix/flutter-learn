import 'package:flutter/material.dart';
import 'package:hello_flutter/core/conf/base.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences prefs(Ref ref) {
  throw UnimplementedError();
}

@riverpod
class LeoTheme extends _$LeoTheme {
  @override
  ThemeMode build() {
    final prefs = ref.watch(prefsProvider);
    final themeModeString = prefs.getString(BaseConf.kThemeModeKey);
    return ThemeMode.values.firstWhere(
      (e) => e.toString() == themeModeString,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> setTheme(ThemeMode mode) async {
    state = mode;
    final prefs = ref.read(prefsProvider);
    await prefs.setString(BaseConf.kThemeModeKey, mode.toString());
  }
}
