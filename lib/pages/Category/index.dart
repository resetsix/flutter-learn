import 'package:flutter/material.dart';
import 'package:hello_flutter/viewmodels/home.dart';

class CategoryView extends StatefulWidget {
  final List<HeadCategoryItem> categoryList;
  const CategoryView({required this.categoryList, super.key});

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
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            width: 80,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: Image.network(widget.categoryList[index].picture),
                ),
                Text(widget.categoryList[index].name),
              ],
            ),
          );
        },
      ),
    );
  }
}
