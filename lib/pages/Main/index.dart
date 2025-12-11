import 'package:flutter/material.dart';
import 'package:hello_flutter/api/home.dart';
import 'package:hello_flutter/pages/Cart/index.dart';
import 'package:hello_flutter/pages/Category/index.dart';
import 'package:hello_flutter/pages/Home/index.dart';
import 'package:hello_flutter/pages/Mine/index.dart';
import 'package:hello_flutter/viewmodels/home.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List<HeadCategoryItem> _headCategoryList = [];

  final _tabList = [
    {
      "icon": "assets/images/ic_public_home_normal.png",
      "active_icon": "assets/images/ic_public_home_active.png",
      "text": "首页",
    },
    {
      "icon": "assets/images/ic_public_pro_normal.png",
      "active_icon": "assets/images/ic_public_pro_active.png",
      "text": "分类",
    },
    {
      "icon": "assets/images/ic_public_cart_normal.png",
      "active_icon": "assets/images/ic_public_cart_active.png",
      "text": "购物车",
    },
    {
      "icon": "assets/images/ic_public_my_normal.png",
      "active_icon": "assets/images/ic_public_my_active.png",
      "text": "我的",
    },
  ];

  @override
  void initState() {
    super.initState();
    _getHeadCategoryList();
  }

  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_tabList.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]["active_icon"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["text"],
      );
    });
  }

  List<Widget> _getChildren() {
    return [
      const HomeView(),
      CategoryView(categoryList: _headCategoryList),
      const CartView(),
      const MineView(),
    ];
  }

  Future<void> _getHeadCategoryList() async {
    final res = await getHeadCategoryListService();
    setState(() {
      _headCategoryList = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getChildren()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: (value) {
          setState(() => _currentIndex = value);
        },
        items: _getTabBarWidget(),
        currentIndex: _currentIndex,
        enableFeedback: false,
      ),
    );
  }
}
