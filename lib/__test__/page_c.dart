import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hello_flutter/core/conf/base.dart';
import 'package:hello_flutter/providers/theme_provider.dart';
import 'package:hello_flutter/utils/device.dart';

class PageC extends ConsumerStatefulWidget {
  const PageC({super.key});

  @override
  ConsumerState<PageC> createState() => _PageCState();
}

class _PageCState extends ConsumerState<PageC> {
  String? _id;

  Future<String?> _getId() async {
    const secureStorage = FlutterSecureStorage();
    return secureStorage.read(key: BaseConf.kDeviceIdKey);
  }

  Future<void> _updateId() async {
    const secureStorage = FlutterSecureStorage();
    secureStorage.write(key: BaseConf.kDeviceIdKey, value: "test");
  }

  Future<void> _deleteId() async {
    const secureStorage = FlutterSecureStorage();
    await secureStorage.delete(key: BaseConf.kDeviceIdKey);
  }

  Future<void> _resetId() async {
    const secureStorage = FlutterSecureStorage();
    await secureStorage.write(
      key: BaseConf.kDeviceIdKey,
      value: await DeviceUtils.getDeviceId(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(leoThemeProvider);
    return Center(
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Theme: ${themeMode.name}"),
          Text("ID: ${_id ?? '未获取'}"),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final deviceId = await _getId();
              if (!mounted) return;
              setState(() {
                _id = deviceId;
              });
            },
            child: const Text("读取 ID"),
          ),
          ElevatedButton(
            onPressed: () async {
              await _updateId();
              final deviceId = await _getId();
              if (!mounted) return;
              setState(() {
                _id = deviceId;
              });
            },
            child: const Text("更新 ID"),
          ),
          ElevatedButton(
            onPressed: () async {
              await _deleteId();
              final deviceId = await _getId();
              if (!mounted) return;
              setState(() {
                _id = deviceId;
              });
            },
            child: const Text("删除 ID"),
          ),
          ElevatedButton(
            onPressed: () async {
              await _resetId();
              final deviceId = await _getId();
              if (!mounted) return;
              setState(() {
                _id = deviceId;
              });
            },
            child: const Text("重置 ID"),
          ),
          Switch(
            value: themeMode == ThemeMode.light,
            onChanged: (value) async {
              await ref
                  .read(leoThemeProvider.notifier)
                  .setTheme(value ? ThemeMode.light : ThemeMode.dark);
            },
          ),
        ],
      ),
    );
  }
}
