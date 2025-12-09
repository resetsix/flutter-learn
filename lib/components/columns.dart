import 'package:flutter/material.dart';

class ColumnPage extends StatelessWidget {
  const ColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = ["A", "B", "C"];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("标题"), centerTitle: true),
        body: Container(
          width: double.infinity,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            // children: [
            //   Container(color: Colors.green, width: 100, height: 100),
            //   const SizedBox(height: 1),
            //   Container(color: Colors.green, width: 100, height: 100),
            //   Container(color: Colors.green, width: 100, height: 100),
            // ],
            children: items
                .map(
                  (item) => Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                    child: Text(item),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
