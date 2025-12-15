import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_flutter/__test__/page_a.dart';
import 'package:hello_flutter/__test__/page_b.dart';
import 'package:hello_flutter/features/profile/presentation/profile_screen.dart';
import 'package:hello_flutter/providers/theme_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/chat/presentation/chat_screen.dart';
import '../../shared/widgets/main_scaffold.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final class AppRoutes {
  AppRoutes._();

  static const String chat = '/chat';
  static const String list = '/list';
  static const String creation = '/creation';
  static const String profile = '/profile';

  // 子路由
  static const String chatDetail = '/chat/:id';
  static const String settings = '/profile/settings';
}

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoutes.chat,
    navigatorKey: _rootNavigatorKey,

    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScaffold(navigationShell: navigationShell);
        },
        branches: [
          // 聊天分支
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.chat,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const ChatScreen(),
                ),
                routes: [
                  // 聊天详情页
                  GoRoute(
                    path: ':id',
                    name: "chatDetail",
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) {
                      final chatId = state.pathParameters['id']!;
                      return ChatDetailScreen(chatId: chatId);
                    },
                  ),
                ],
              ),
            ],
          ),

          // 列表分支
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.list,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const PageA(),
                  // child: const ImageScreen(),
                ),
              ),
            ],
          ),

          // 创作分支
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.creation,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const PageB(),
                  // child: const VideoScreen(),
                ),
              ),
            ],
          ),

          // 我的分支
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const ProfileScreen(),
                ),
                routes: [
                  // 设置页
                  GoRoute(
                    path: 'settings',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const SettingsScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],

    // 错误页面
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('页面未找到: ${state.uri}'))),
  );
}

// 聊天详情页（示例）
class ChatDetailScreen extends StatelessWidget {
  final String chatId;

  const ChatDetailScreen({required this.chatId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('聊天 $chatId')),
      body: Center(child: Text('聊天详情页: $chatId')),
    );
  }
}

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(leoThemeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('设置')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('深色模式'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) async {
                await ref.read(leoThemeProvider.notifier).toggleDarkMode(value);
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('通知设置'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('通知设置功能开发中...')));
            },
          ),
        ],
      ),
    );
  }
}
