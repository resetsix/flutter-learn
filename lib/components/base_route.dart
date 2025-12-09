import 'package:flutter/material.dart';

class BaseRouterPage extends StatelessWidget {
  const BaseRouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ListPage(),
      initialRoute: "/list",
      routes: {
        "/list": (context) => const ListPage(),
        "/detail": (context) => const DetailPage(),
      },
    );
  }
}

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 100,
        itemBuilder: (x, int index) {
          return GestureDetector(
            onTap: () async {
              // await Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const DetailPage();
              //     },
              //   ),
              // );
              Navigator.pushNamed(
                context,
                "/detail",
                arguments: {"i": index + 1},
              );
            },
            child: Container(
              color: Colors.blue,
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              height: 100,
              child: Text(
                "列表项${index + 1}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final String _id = "";

  @override
  void initState() {
    super.initState();

    // Future.microtask(() {
    //   if (ModalRoute.of(context) != null) {
    //     if (!context.mounted) return;
    //     final Map<String, dynamic> params =
    //         ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    //     setState(() {
    //       _id = params["i"].toString();
    //       print("_id,$_id");
    //     });
    //   } else {
    //     print("no");
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("详情页$_id")),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("返回上一页"),
        ),
      ),
    );
  }
}
