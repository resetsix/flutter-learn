import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String imgSrc =
        "https://fastly.picsum.photos/id/620/200/300.jpg?hmac=ZLg-jrbFo8ASzAzQlxN4yMTNJJBpZtcpDXfwBxAvcT4";
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text(("Text 组件实例"))),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          color: Colors.green,
          // child: Image.asset("assets/images/xin.webp"),
          child: Image.network(imgSrc),
        ),
      ),
    );
  }
}
