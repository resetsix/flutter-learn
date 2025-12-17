import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hello_flutter/core/conf/base.dart';
import 'package:hello_flutter/utils/device.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInitializer {
  AppInitializer._();

  static Future<SharedPreferences> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = await SharedPreferences.getInstance();
    await _initDeviceId(prefs);
    return prefs;
  }

  static Future<void> _initDeviceId(SharedPreferences prefs) async {
    // final currentId = prefs.getString(BaseConf.kDeviceIdKey);
    const secureStorage = FlutterSecureStorage();
    final newDeviceId = await DeviceUtils.getDeviceId();
    final currentId = await secureStorage.read(key: BaseConf.kDeviceIdKey);
    final hasId = await secureStorage.containsKey(key: BaseConf.kDeviceIdKey);

    if (hasId == false) {
      await secureStorage.write(key: BaseConf.kDeviceIdKey, value: newDeviceId);
      debugPrint("首次运行，生成唯一标识: $newDeviceId");
    } else {
      debugPrint("读取已有唯一标识: $currentId");
    }
  }
}
