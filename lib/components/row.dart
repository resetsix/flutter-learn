import 'package:flutter/material.dart';

class RowPage extends StatelessWidget {
  const RowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final list = ["A", "B", "C"];
    return MaterialApp(
      home: Scaffold(
        body: Row(
          spacing: 20,
          mainAxisSize: MainAxisSize.max,
          children: list
              .map(
                (item) =>
                    Container(width: 100, height: 100, color: Colors.green),
              )
              .toList(),
        ),
      ),
    );
  }
}
