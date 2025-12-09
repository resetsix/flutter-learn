import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("ListView 组件实例")),
        body: ListView.separated(
          itemCount: 100,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 30,
              color: Colors.blue,
              // margin: const EdgeInsets.only(top: 10),
              child: Text("第$index个"),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(color: Colors.grey, height: 1);
          },
        ),
        // body: ListView.builder(
        //   itemCount: 100,
        //   padding: const EdgeInsets.symmetric(horizontal: 20),
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //       alignment: Alignment.center,
        //       width: double.infinity,
        //       height: 30,
        //       color: Colors.blue,
        //       margin: const EdgeInsets.only(top: 10),
        //       child: Text("第$index个"),
        //     );
        //   },
        // ),
      ),
      // body: ListView(
      //   padding: const EdgeInsets.symmetric(horizontal: 20),
      //   children: List.generate(100, (index) {
      //     return Container(
      //       alignment: Alignment.center,
      //       width: double.infinity,
      //       height: 80,
      //       color: Colors.blue,
      //       margin: const EdgeInsets.only(top: 10),
      //       child: Text("第$index个"),
      //     );
      //   }),
      // ),
    );
  }
}
