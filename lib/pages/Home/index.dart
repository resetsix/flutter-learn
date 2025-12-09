import 'package:flutter/material.dart';
import 'package:hello_flutter/components/Home/hot_view.dart';
import 'package:hello_flutter/components/Home/more_list_view.dart';
import 'package:hello_flutter/components/Home/slider_view.dart';
import 'package:hello_flutter/components/Home/suggestion_view.dart';
import 'package:hello_flutter/pages/Category/index.dart';
import 'package:hello_flutter/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _bannerList = [
    BannerItem(
      id: "1",
      imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
    ),
    BannerItem(
      id: "2",
      imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png",
    ),
    BannerItem(
      id: "2",
      imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg",
    ),
  ];

  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: SliderView(bannerList: _bannerList)),
      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      const SliverToBoxAdapter(child: CategoryView()),
      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      const SliverToBoxAdapter(child: SuggestionView()),
      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: HotView()),
              SizedBox(width: 10),
              Expanded(child: HotView()),
            ],
          ),
        ),
      ),
      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      const MoreListView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
