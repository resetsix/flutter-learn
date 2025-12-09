import 'package:flutter/material.dart';

class SingleChildScrollViewPage extends StatefulWidget {
  const SingleChildScrollViewPage({super.key});

  @override
  State<SingleChildScrollViewPage> createState() =>
      _SingleChildScrollViewPageState();
}

class _SingleChildScrollViewPageState extends State<SingleChildScrollViewPage> {
  final ScrollController _scroll = ScrollController();

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("SingleChildScrollView 组件实例")),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scroll,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                spacing: 10,
                children: List.generate(50, (index) {
                  return Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Text(
                      "第$index个文本组件",
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  );
                }),
              ),
            ),

            Positioned(
              right: 10,
              top: 10,
              child: GestureDetector(
                onTap: () {
                  if (_scroll.hasClients) {
                    _scroll.jumpTo(0);
                  }
                },
                child: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: const Text(("回到顶部")),
                ),
              ),
            ),

            Positioned(
              right: 10,
              bottom: 10,
              child: GestureDetector(
                onTap: () async {
                  // _scroll.jumpTo(_scroll.position.maxScrollExtent);
                  if (_scroll.hasClients) {
                    await _scroll.animateTo(
                      _scroll.position.maxScrollExtent,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn,
                    );
                  }
                },
                child: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: const Text(("去底部")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
