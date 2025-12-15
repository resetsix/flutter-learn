import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScaffold({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: isIOS
          ? _buildIOSBottomBar(context)
          : _buildMaterialBottomBar(context),
    );
  }

  BottomNavigationBarItem _buildiOSTabItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Icon(icon, size: 25),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Icon(activeIcon, size: 25),
      ),
      label: label,
    );
  }

  // iOS 风格底部导航栏
  Widget _buildIOSBottomBar(BuildContext context) {
    return CupertinoTabBar(
      height: 56,
      currentIndex: navigationShell.currentIndex,
      onTap: (index) {
        navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        );
      },
      backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
      activeColor: CupertinoColors.activeBlue,
      inactiveColor: CupertinoColors.systemGrey,
      items: [
        _buildiOSTabItem(
          icon: CupertinoIcons.chat_bubble,
          activeIcon: CupertinoIcons.chat_bubble_fill,
          label: '聊天',
        ),
        _buildiOSTabItem(
          icon: CupertinoIcons.photo,
          activeIcon: CupertinoIcons.photo_fill,
          label: '图片',
        ),
        _buildiOSTabItem(
          icon: CupertinoIcons.video_camera,
          activeIcon: CupertinoIcons.video_camera_solid,
          label: '视频',
        ),
        _buildiOSTabItem(
          icon: CupertinoIcons.person,
          activeIcon: CupertinoIcons.person_fill,
          label: '我的',
        ),
      ],
    );
  }

  // Material 风格底部导航栏
  Widget _buildMaterialBottomBar(BuildContext context) {
    return NavigationBar(
      height: 70,
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: (index) {
        navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        );
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.chat_bubble_outline),
          selectedIcon: Icon(Icons.chat_bubble),
          label: '聊天',
        ),
        NavigationDestination(
          icon: Icon(Icons.photo_outlined),
          selectedIcon: Icon(Icons.photo),
          label: '图片',
        ),
        NavigationDestination(
          icon: Icon(Icons.video_camera_back_outlined),
          selectedIcon: Icon(Icons.video_camera_back),
          label: '视频',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: '我的',
        ),
      ],
    );
  }
}
