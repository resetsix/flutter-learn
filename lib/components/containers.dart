import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          transform: Matrix4.rotationZ(0.1),
          width: 200,
          height: 200,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          // color: Colors.red,
          // decoration 实现更高级的样式效果
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(width: 3, color: Colors.yellow),
            borderRadius: BorderRadius.circular(26),
          ),
          alignment: Alignment.center,
          child: const Text(
            "Hello",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: .w500,
            ),
          ),
        ),
      ),
    );
  }
}
