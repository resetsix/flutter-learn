import 'package:flutter/material.dart';

class PaddingPage extends StatelessWidget {
  const PaddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(title: const Text(("标题"))),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: SizedBox.expand(
            child: ColoredBox(color: Colors.yellow, child: Text("内容")),
          ),
        ),
      ),
    );
  }
}
