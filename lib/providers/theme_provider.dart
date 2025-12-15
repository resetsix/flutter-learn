import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_provider.g.dart';

@riverpod
class LeoTheme extends _$LeoTheme {
  static const String _key = 'theme_mode';

  @override
  ThemeMode build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final themeModeString = prefs.getString(_key);

    if (themeModeString == 'light') return ThemeMode.light;
    if (themeModeString == 'dark') return ThemeMode.dark;
    return ThemeMode.system;
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;

    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setString(_key, mode.toString().split('.').last);
  }

  Future<void> toggleDarkMode(bool isDark) async {
    await setThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}

/// 预加载
@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError('需要在 main.dart 中覆盖');
}
