import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_flutter/providers/counter_provider.dart';

class PageA extends ConsumerWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("页面 A")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            OutlinedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).decrement();
              },
              child: const Text("减少"),
            ),
            const SizedBox(height: 20),

            Text("$count"),
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              child: const Text("增加"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
