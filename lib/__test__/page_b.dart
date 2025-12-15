import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_flutter/providers/counter_provider.dart';

class PageB extends ConsumerWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('页面 B')),
      body: Center(child: Text("获取到的count：$count")),
    );
  }
}
