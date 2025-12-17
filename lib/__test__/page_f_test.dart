import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/web.dart';
import 'package:permission_handler/permission_handler.dart';

class PageFTest extends StatefulWidget {
  const PageFTest({super.key});

  @override
  State<PageFTest> createState() => _PageFTestState();
}

class _PageFTestState extends State<PageFTest> {
  final log = Logger();

  Future<void> _handlePermission(Permission permission, String name) async {
    if (!mounted) return;
    final status = await permission.status;
    if (!mounted) return;

    if (status.isDenied) {
      await permission.request();
    }

    if (status.isPermanentlyDenied) {
      _showDialogToSetting(name);
    }

    if (status.isGranted || status.isLimited) {
      // log.i(status.isGranted);
      // Fluttertoast.showToast(
      //   msg: "已批准。",
      //   gravity: ToastGravity.BOTTOM,
      //   toastLength: Toast.LENGTH_LONG,
      //   backgroundColor: Colors.black87,
      //   timeInSecForIosWeb: 2,
      // );
      EasyLoading.showSuccess("已批准!");
    }
  }

  Future<void> _showDialogToSetting(String name) async {
    if (!mounted) return;
    await showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: Text("需要$name权限"),
        content: const Text("您需要授予该权限以继续操作。"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("稍后再说"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await openAppSettings();
            },
            child: const Text("前往设置"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          TextButton(
            onPressed: () async {
              await _handlePermission(Permission.photos, "相册");
            },
            child: const Text("相册权限测试"),
          ),
          TextButton(
            onPressed: () async {
              await _handlePermission(Permission.microphone, "麦克风");
            },
            child: const Text("麦克风权限测试"),
          ),
        ],
      ),
    );
  }
}
