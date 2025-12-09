import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello",
      theme: ThemeData(scaffoldBackgroundColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(title: const Text("头部区域")),
        body: const Center(child: Text("中部区域")),
        bottomNavigationBar: const SizedBox(
          height: 80,
          child: Center(child: Text("底部区域")),
        ),
      ),
    );
  }
}
