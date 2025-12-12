import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('我的')),
      body: ListView(
        children: [
          // 用户信息卡片
          Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    child: Icon(Icons.person, size: 32),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '用户名',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'user@example.com',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),

          // 功能列表
          _buildSection(
            context,
            title: '账户',
            items: [
              _MenuItem(
                icon: Icons.account_balance_wallet,
                title: '我的订阅',
                onTap: () {},
              ),
              _MenuItem(icon: Icons.history, title: '使用记录', onTap: () {}),
            ],
          ),

          _buildSection(
            context,
            title: '设置',
            items: [
              _MenuItem(
                icon: Icons.settings,
                title: '设置',
                onTap: () async {
                  await context.push('/profile/settings');
                },
              ),
              _MenuItem(icon: Icons.help, title: '帮助与反馈', onTap: () {}),
              _MenuItem(icon: Icons.info, title: '关于', onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<_MenuItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: items.map((item) {
              return ListTile(
                leading: Icon(item.icon),
                title: Text(item.title),
                trailing: const Icon(Icons.chevron_right),
                onTap: item.onTap,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  _MenuItem({required this.icon, required this.title, required this.onTap});
}
