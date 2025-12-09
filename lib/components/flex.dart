import 'package:flutter/material.dart';

class FlexPage extends StatelessWidget {
  const FlexPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final list = ["A", "B", "C"];

    return MaterialApp(
      home: Scaffold(
        body: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: double.infinity, height: 100, color: Colors.green),
            Expanded(
              flex: 10,
              child: Container(width: double.infinity, color: Colors.red),
            ),
            Container(width: double.infinity, height: 100, color: Colors.green),
          ],
          // children: list
          //     .map(
          //       (item) =>
          //           Container(width: 100, height: 100, color: Colors.green),
          //     )
          //     .toList(),
        ),
      ),
    );
  }
}
