import 'package:easy_refresh/easy_refresh.dart';
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
  List<HomeRecommendRes> _homeRecommendList = [];
  // final _controller = ScrollController();
  final _refreshController = EasyRefreshController();
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _initFetch();
    _registerEvent();

    // _getSuggestionResultList();
    // _getBannerList();
    // _getHeadCategoryList();
    // _getInvogueList();
    // _getOnestopList();
    // _getRecommendList();
  }

  // Future<void> _getSuggestionResultList() async {
  //   final res = await getSuggestionResultListService();
  //   setState(() {
  //     _hotResultList = res;
  //   });
  // }

  // Future<void> _getBannerList() async {
  //   final res = await getBannerListService();
  //   setState(() {
  //     _bannerList = res;
  //   });
  // }

  // Future<void> _getHeadCategoryList() async {
  //   final res = await getHeadCategoryListService();
  //   setState(() {
  //     _headCategoryList = res;
  //   });
  // }

  // Future<void> _getInvogueList() async {
  //   final res = await getInvogueResultListService();
  //   setState(() {
  //     _invogueResultList = res;
  //   });
  // }

  // Future<void> _getOnestopList() async {
  //   final res = await getOnsstopResultListService();
  //   setState(() {
  //     _hotOnestopList = res;
  //   });
  // }

  Future<void> _getRecommendList() async {
    if (_isLoading || !_hasMore) {
      return;
    }
    final int requestLimit = _page * 8;
    _isLoading = true;
    final res = await getHomeRecommendListService({"limit": requestLimit});
    _isLoading = false;

    setState(() {
      _homeRecommendList = res;
    });
    _page++;

    if (res.length < requestLimit) {
      _hasMore = false;
    }
  }

  void _registerEvent() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshController.callRefresh();
    });

    // _controller.addListener(() {
    //   if (_controller.position.maxScrollExtent >=
    //       _controller.position.pixels - 50) {
    //     _getRecommendList();
    //   }
    // });
  }

  Future<void> _onRefresh() async {
    _page = 1;
    _isLoading = false;
    _hasMore = true;
    _initFetch();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 110,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(40),
        ),
        content: const Text("刷新成功！", textAlign: TextAlign.center),
      ),
    );
  }

  Future<void> _initFetch() async {
    final results = await Future.wait([
      getBannerListService(),
      getHeadCategoryListService(),
      getSuggestionResultListService(),
      getInvogueResultListService(),
      getOnsstopResultListService(),
    ]);

    if (!mounted) {
      return;
    }

    setState(() {
      _bannerList = results[0] as List<BannerItem>;
      _headCategoryList = results[1] as List<HeadCategoryItem>;
      _hotResultList = results[2] as SuggestionResultRes;
      _invogueResultList = results[3] as SuggestionResultRes;
      _hotOnestopList = results[4] as SuggestionResultRes;
    });

    _getRecommendList();
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
      MoreListView(data: _homeRecommendList),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      controller: _refreshController,
      triggerAxis: Axis.vertical,
      onRefresh: _onRefresh,
      header: const MaterialHeader(),
      footer: const CupertinoFooter(),
      onLoad: _getRecommendList,
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        // controller: _controller,
        slivers: _getScrollChildren(),
      ),
    );
  }

  @override
  void dispose() {
    // _controller.dispose();
    _refreshController.dispose();
    super.dispose();
  }
}
