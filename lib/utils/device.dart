import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:uuid/uuid.dart';

class DeviceUtils {
  DeviceUtils._();

  static Future<String> getDeviceId() async {
    if (Platform.isIOS) return getIosDeviceId();
    if (Platform.isAndroid) return getAndroidDeviceId();
    return const Uuid().v4();
  }

  static Future<String> getAndroidDeviceId() async {
    final id = await const AndroidId().getId();
    const uuid = Uuid();
    if (id != null && id.isNotEmpty) {
      return uuid.v5(Namespace.dns.value, id);
    }
    return uuid.v4();
  }

  static Future<String> getIosDeviceId() async {
    final deviceInfo = await DeviceInfoPlugin().iosInfo;
    final id = deviceInfo.identifierForVendor;
    const uuid = Uuid();
    if (id != null && id.isNotEmpty) {
      return id;
    }
    return uuid.v4();
  }
}
