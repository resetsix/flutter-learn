import 'package:flutter/widgets.dart';
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
    final currentId = prefs.getString(BaseConf.kDeviceIdKey);

    if (currentId == null) {
      final newDeviceId = await DeviceUtils.getDeviceId();
      await prefs.setString(BaseConf.kDeviceIdKey, newDeviceId);
      debugPrint("首次运行，生成唯一标识: $newDeviceId");
    } else {
      debugPrint("读取已有唯一标识: $currentId");
    }
  }
}
