import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text(("Stack 代码实例"))),
        body: Container(
          width: 200,
          height: 200,
          margin: const EdgeInsets.only(top: 50),
          color: Colors.white,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(width: 300, height: 300, color: Colors.grey),
              Positioned(
                top: 10,
                left: 10,
                child: Container(width: 50, height: 50, color: Colors.red),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(width: 50, height: 50, color: Colors.blue),
              ),

              // 也可以使用 Align 替代 Positioned
              Align(
                alignment: Alignment.topRight,
                child: Transform.translate(
                  offset: const Offset(-4, -10),
                  child: const Text("未读消息"),
                ),
              ),
            ],
          ),
        ),
        // Stack 基础用法
        // body: Stack(
        //   alignment: AlignmentDirectional.center,
        //   children: [
        //     Container(width: 300, height: 300, color: Colors.blue),
        //     Container(width: 200, height: 200, color: Colors.green),
        //     Container(width: 100, height: 100, color: Colors.yellow),
        //     Container(width: 50, height: 50, color: Colors.purple),
        //   ],
        // ),
      ),
    );
  }
}
