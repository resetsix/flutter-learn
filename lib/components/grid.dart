import 'package:flutter/material.dart';

class GridPage extends StatefulWidget {
  const GridPage({super.key});

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("GridView 组件实例"), centerTitle: true),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            // crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            maxCrossAxisExtent: 60,
            childAspectRatio: 2,
          ),
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(2),
              ),
              alignment: Alignment.center,
              child: Text("第$index个"),
            );
          },
        ),
        // body: GridView.extent(
        //   padding: const EdgeInsets.all(10),
        //   maxCrossAxisExtent: 60,
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   children: List.generate(100, (index) {
        //     return Container(
        //       height: 100,
        //       decoration: BoxDecoration(
        //         color: Colors.blue,
        //         borderRadius: BorderRadius.circular(2),
        //       ),
        //       alignment: Alignment.center,
        //       child: Text("第$index个"),
        //     );
        //   }),
        // ),
        // body: GridView.count(
        //   scrollDirection: Axis.vertical,
        //   padding: const EdgeInsets.all(10),
        //   crossAxisCount: 3,
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   children: List.generate(100, (index) {
        //     return Container(
        //       height: 100,
        //       decoration: BoxDecoration(
        //         color: Colors.blue,
        //         borderRadius: BorderRadius.circular(2),
        //       ),
        //       alignment: Alignment.center,
        //       child: Text("第$index个"),
        //     );
        //   }),
        // ),
      ),
    );
  }
}
