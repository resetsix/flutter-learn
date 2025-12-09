import 'package:flutter/material.dart';

class CustomScrollViewPage extends StatefulWidget {
  const CustomScrollViewPage({super.key});

  @override
  State<CustomScrollViewPage> createState() => _CustomScrollViewPageState();
}

class _CustomScrollViewPageState extends State<CustomScrollViewPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("CustomScrollView 组件实例")),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                color: Colors.blue,
                height: 260,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: 10,
                      onPageChanged: (value) => setState(() {
                        setState(() {
                          _currentIndex = value;
                        });
                      }),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.center,
                          child: Text(
                            ("轮播图${index + 1}"),
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(10, (index) {
                            return GestureDetector(
                              onTap: () async {
                                // _pageController.jumpToPage(index);
                                await _pageController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.linear,
                                );
                                setState(() => _currentIndex = index);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: _currentIndex == index
                                      ? Colors.red
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 10)),

            SliverPersistentHeader(delegate: _StrickCategory(), pinned: true),

            const SliverToBoxAdapter(child: SizedBox(height: 10)),

            SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(10, (index) {
                return Container(
                  color: Colors.blue,
                  height: 60,
                  alignment: Alignment.center,
                  child: Text(
                    "第${index + 1}项",
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }),
            ),

            SliverList.separated(
              itemCount: 10,

              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.blue,
                  height: 60,
                  alignment: Alignment.center,
                  child: Text(
                    "第${index + 1}项",
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _StrickCategory extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.blue,
            width: 60,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: Text(
              ("分类${index + 1}"),
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => 80; // 最大展开高度

  @override
  double get minExtent => 40; // 最小折叠高度

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false; // 不需要重建
  }
}
