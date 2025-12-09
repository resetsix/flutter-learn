import 'package:flutter/material.dart';
import 'package:hello_flutter/api/home.dart';
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
  List<BannerItem> _bannerList = [];
  List<HeadCategoryItem> _headCategoryList = [];

  // 首页主体
  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: SliderView(bannerList: _bannerList)),
      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: CategoryView(categoryList: _headCategoryList)),
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
  void initState() {
    super.initState();

    _getBannerList();
    _getHeadCategoryList();
  }

  Future<void> _getBannerList() async {
    final res = await getBannerListService();
    setState(() {
      _bannerList = res;
    });
  }

  Future<void> _getHeadCategoryList() async {
    final res = await getHeadCategoryListService();
    setState(() {
      _headCategoryList = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
