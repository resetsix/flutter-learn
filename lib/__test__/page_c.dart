import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_flutter/core/conf/base.dart';
import 'package:hello_flutter/providers/theme_provider.dart';

class PageC extends ConsumerWidget {
  const PageC({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(leoThemeProvider);
    final prefs = ref.watch(prefsProvider);
    return Center(
      child: Column(
        children: [
          Text(themeMode.name),
          Text(prefs.getString(BaseConf.kDeviceIdKey) ?? ""),
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
