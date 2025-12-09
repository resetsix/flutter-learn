import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 80,
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "分类${index + 1}",
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
