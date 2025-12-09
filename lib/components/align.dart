import 'package:flutter/material.dart';

class AlignPage extends StatelessWidget {
  const AlignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.blue,
          child: const Center(
            widthFactor: 1,
            heightFactor: 1,
            child: Icon(Icons.star, size: 120, color: Colors.green),
          ),
        ),
      ),
    );
  }
}
