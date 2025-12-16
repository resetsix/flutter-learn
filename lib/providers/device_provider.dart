import 'package:hello_flutter/core/conf/base.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'theme_provider.dart';

part 'device_provider.g.dart';

@riverpod
String deviceId(Ref ref) {
  final prefs = ref.watch(prefsProvider);
  return prefs.getString(BaseConf.kDeviceIdKey) ?? 'unknown';
}
