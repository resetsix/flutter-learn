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
  SuggestionResultRes _hotResultList = SuggestionResultRes(
    id: '',
    title: '',
    subTypes: [],
  );
  SuggestionResultRes _invogueResultList = SuggestionResultRes(
    id: '',
    title: '',
    subTypes: [],
  );
  SuggestionResultRes _hotOnestopList = SuggestionResultRes(
    id: '',
    title: '',
    subTypes: [],
  );

  @override
  void initState() {
    super.initState();
    _getSuggestionResultList();

    _getBannerList();
    _getHeadCategoryList();
    _getInvogueList();
    _getOnestopList();
  }

  Future<void> _getSuggestionResultList() async {
    final res = await getSuggestionResultListService();
    setState(() {
      _hotResultList = res;
    });
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

  Future<void> _getInvogueList() async {
    final res = await getInvogueResultListService();
    setState(() {
      _invogueResultList = res;
    });
  }

  Future<void> _getOnestopList() async {
    final res = await getOnsstopResultListService();
    setState(() {
      _hotOnestopList = res;
    });
  }

  // 首页主体
  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: SliderView(bannerList: _bannerList)),
      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: CategoryView(categoryList: _headCategoryList)),
      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: SuggestionView(data: _hotResultList)),
      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: HotView(data: _invogueResultList)),
              const SizedBox(width: 10),
              Expanded(child: HotView(data: _hotOnestopList)),
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
