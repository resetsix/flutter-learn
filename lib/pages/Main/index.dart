import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/Cart/index.dart';
import 'package:hello_flutter/pages/Category/index.dart';
import 'package:hello_flutter/pages/Home/index.dart';
import 'package:hello_flutter/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

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
      "active_icon": "assets/images/ic_public_pro_active.png",
      "text": "购物车",
    },
    {
      "icon": "assets/images/ic_public_my_normal.png",
      "active_icon": "assets/images/ic_public_my_active.png",
      "text": "我的",
    },
  ];

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
      const CartView(),
      const CategoryView(),
      const MineView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: IndexedStack(index: _currentIndex, children: _getChildren()),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          onTap: (value) {
            setState(() => _currentIndex = value);
          },
          items: _getTabBarWidget(),
          currentIndex: _currentIndex,
        ),
      ),
    );
  }
}
