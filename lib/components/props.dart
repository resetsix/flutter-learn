import 'package:flutter/material.dart';

// 父组件
class PropsPage extends StatefulWidget {
  const PropsPage({super.key});

  @override
  State<PropsPage> createState() => _PropsPageState();
}

class _PropsPageState extends State<PropsPage> {
  final list = ["麻婆豆腐", "宫保鸡丁", "鱼香肉丝", "酸菜鱼", "鲜锅兔"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("父子组件传参示例")),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          child: GridView.builder(
            itemCount: list.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Child(
                food: list[index],
                index: index,
                delHandle: (index) => setState(() {
                  // list.remove(list[index]);
                  list.removeAt(index);
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}

// 子组件

class Child extends StatefulWidget {
  final String food;
  final int index;
  // 等同于  final void Function(int index) delHandle;
  final ValueChanged<int> delHandle;

  const Child({
    required this.index,
    required this.delHandle,
    required this.food,
    super.key,
  });

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(widget.food),
        ),

        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            color: Colors.red,
            onPressed: () {
              widget.delHandle(widget.index);
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ],
    );
  }
}

// class PropsPage extends StatelessWidget {
//   const PropsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text("父子组件传参示例")),
//         body: Container(
//           alignment: Alignment.center,
//           child: const Column(
//             children: [
//               Text("父组件", style: TextStyle(color: Colors.blue, fontSize: 30)),
//               ChildStatelessPage(message: "张三"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChildStatelessPage extends StatefulWidget {
//   final String? message;
//   const ChildStatelessPage({required this.message, super.key});

//   @override
//   State<ChildStatelessPage> createState() => _ChildStatelessPageState();
// }

// class _ChildStatelessPageState extends State<ChildStatelessPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       "子组件 ${widget.message}",
//       style: const TextStyle(color: Colors.red, fontSize: 20),
//     );
//   }
// }
