import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PageF extends StatefulWidget {
  const PageF({super.key});

  @override
  State<PageF> createState() => _PageFState();
}

class _PageFState extends State<PageF> {
  Future<void> _handlePermission(Permission permission, String name) async {
    final status = await permission.request();

    if (!mounted) return;

    if (status.isGranted || status.isLimited) {
      String tip = "✅ $name 权限已获取！";
      if (status.isLimited) {
        tip = "⚠️ $name 权限受限 (仅部分照片)";
      }
      _showSnack(Colors.green, tip);
      return;
    }

    if (status.isPermanentlyDenied) {
      _showDialogToSettings(name);
      return;
    }

    if (status.isDenied || status.isRestricted) {
      _showSnack(Colors.red, "❌ 用户拒绝了 $name 权限");
      return;
    }
  }

  Future<void> _handlePhotoPermission() async {
    Permission p = Permission.photos;

    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      // Android 13 (SDK 33) 以下，访问相册其实是 Storage 权限
      if (androidInfo.version.sdkInt < 33) {
        p = Permission.storage;
      }
    }

    await _handlePermission(p, "相册");
  }

  /// 提示条辅助函数
  void _showSnack(Color color, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(text),
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }

  /// 弹窗引导去设置页
  Future<void> _showDialogToSettings(String name) async {
    await showAdaptiveDialog(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        title: Text("$name 权限受限"),
        content: const Text("您之前永久拒绝了该权限，请在设置中手动开启，否则无法使用该功能。"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("取消"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(ctx).pop();
              await openAppSettings();
            },
            child: const Text("去设置"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("权限测试")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. 相机
              ElevatedButton.icon(
                icon: const Icon(Icons.camera_alt),
                label: const Text('相机权限测试'),
                onPressed: () => _handlePermission(Permission.camera, "相机"),
              ),
              const SizedBox(height: 15),

              // 2. 相册 (注意：使用了专门的处理函数)
              ElevatedButton.icon(
                icon: const Icon(Icons.photo_library),
                label: const Text('相册权限测试'),
                onPressed: _handlePhotoPermission,
              ),
              const SizedBox(height: 15),

              // 3. 语音识别 (STT)
              ElevatedButton.icon(
                icon: const Icon(Icons.text_fields),
                label: const Text('语音识别(STT)测试'),
                onPressed: () => _handlePermission(Permission.speech, "语音识别"),
              ),
              const SizedBox(height: 15),

              // 4. 麦克风
              ElevatedButton.icon(
                icon: const Icon(Icons.mic),
                label: const Text('麦克风权限测试'),
                onPressed: () =>
                    _handlePermission(Permission.microphone, "麦克风"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
