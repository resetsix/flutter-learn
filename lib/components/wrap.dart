import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget {
  const WrapPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> genList() {
      return List.generate(10, (index) {
        return Container(width: 100, height: 100, color: Colors.green);
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text(("Wrap 换行组件"))),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.spaceAround,
            children: genList(),
          ),
        ),
      ),
    );
  }
}
