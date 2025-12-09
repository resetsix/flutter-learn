import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text(("Text 组件实例"))),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.purple,
          alignment: Alignment.center,
          child: const Text.rich(
            TextSpan(
              text: "Hello",
              children: [
                TextSpan(
                  text: "Flutter",
                  style: TextStyle(color: Colors.blue),
                ),
                TextSpan(text: "!"),
              ],
            ),
          ),
          // child: const Text(
          //   "这是一段长文本测试这是一段长文本测试这是一段长文本测试这是一段长文本测试这是一段长文本测试这是一段长文本测试",
          //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          //   maxLines: 2,
          //   // 溢出后的处理方式
          //   // TextOverflow.ellipsis = 显示省略号 (...) -> 最常用
          //   // TextOverflow.clip     = 直接切断 (默认)
          //   // TextOverflow.fade     = 渐隐消失
          //   // TextOverflow.visible  = 强行渲染出来 (可能导致溢出报错)
          //   overflow: TextOverflow.fade,
          // ),
          // child: const Text(
          //   "Hello Flutter!",
          //   style: TextStyle(
          //     fontSize: 30,
          //     color: Colors.blue,
          //     fontStyle: FontStyle.italic,
          //     fontWeight: FontWeight.w500,
          //     decoration: TextDecoration.lineThrough,
          //     decorationColor: Colors.amberAccent,
          //   ),
          // ),
        ),
      ),
    );
  }
}
