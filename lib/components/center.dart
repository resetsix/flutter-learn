import 'package:flutter/material.dart';

class CenterPage extends StatelessWidget {
  const CenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.menu),
          ),
          title: const Text("文本示例"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () => {}, icon: const Icon(Icons.menu)),
          ],
        ),
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            // alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.red,
              // borderRadius: BorderRadius.circular(26),
            ),
            // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            // child: const Text(("只是一个居中内容")),
            child: const Center(
              child: Text(("只是一个居中内容"), style: TextStyle(fontSize: 24)),
            ),
          ),
        ),
      ),
    );
  }
}
