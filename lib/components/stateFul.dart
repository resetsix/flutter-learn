import 'package:flutter/material.dart';

class HomeStatePage extends StatefulWidget {
  const HomeStatePage({super.key});

  @override
  State<HomeStatePage> createState() => _HomeStatePageState();
}

class _HomeStatePageState extends State<HomeStatePage> {
  int _count = 0;
  void _updateCount() => setState(() => _count++);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello",
      theme: ThemeData(scaffoldBackgroundColor: Colors.green),
      home: Scaffold(
        appBar: AppBar(title: const Text("头部区域")),
        body: Center(
          child: OutlinedButton(
            onPressed: _updateCount,
            child: Text("中部区域$_count"),
          ),
        ),
        bottomNavigationBar: const SizedBox(
          height: 80,
          child: Center(child: Text("底部区域")),
        ),
      ),
    );
  }
}
