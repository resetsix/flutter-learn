import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/Login/index.dart';
import 'package:hello_flutter/stores/auth.dart';
import 'package:hello_flutter/viewmodels/user.dart';

class MineView extends StatefulWidget {
  const MineView({super.key});

  @override
  State<MineView> createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  LoginRes? _userInfo;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    setState(() => _isLoading = true);

    final userInfo = await AuthStore.getUserInfo();

    setState(() {
      _userInfo = userInfo;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_userInfo == null) {
      return _buildNotLoginView();
    }

    return _buildUserInfoView();
  }

  // 未登录视图
  Widget _buildNotLoginView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_outline, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text('未登录', style: TextStyle(fontSize: 18, color: Colors.grey[600])),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text('去登录'),
          ),
        ],
      ),
    );
  }

  // 已登录用户信息视图
  Widget _buildUserInfoView() {
    return CustomScrollView(
      slivers: [
        // 顶部用户信息卡片
        SliverToBoxAdapter(child: _buildUserHeader()),

        // 功能列表
        SliverToBoxAdapter(child: _buildFunctionList()),

        // 退出登录按钮
        SliverToBoxAdapter(child: _buildLogoutButton()),
      ],
    );
  }

  // 用户头部信息
  Widget _buildUserHeader() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[400]!, Colors.blue[600]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // 头像
          _buildAvatar(),
          const SizedBox(width: 16),

          // 用户信息
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 昵称
                Text(
                  _userInfo!.nickname,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),

                // 账号
                Row(
                  children: [
                    const Icon(
                      Icons.account_circle_outlined,
                      size: 16,
                      color: Colors.white70,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '账号: ${_userInfo!.account}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 编辑按钮
          IconButton(
            onPressed: () {
              // TODO: 跳转到编辑个人信息页面
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('编辑个人信息功能开发中')));
            },
            icon: const Icon(Icons.edit, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // 头像组件
  Widget _buildAvatar() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.white,
        backgroundImage: _userInfo!.avatar.isNotEmpty
            ? NetworkImage(_userInfo!.avatar)
            : null,
        child: _userInfo!.avatar.isEmpty
            ? Text(
                _userInfo!.nickname.isNotEmpty
                    ? _userInfo!.nickname[0].toUpperCase()
                    : 'U',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              )
            : null,
      ),
    );
  }

  // 功能列表
  Widget _buildFunctionList() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.person_outline,
            title: '个人信息',
            subtitle: '查看和编辑个人资料',
            onTap: () {
              // TODO: 跳转到个人信息页面
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('个人信息页面开发中')));
            },
          ),
          const Divider(height: 1, indent: 60),

          _buildMenuItem(
            icon: Icons.settings_outlined,
            title: '设置',
            subtitle: '账号与安全设置',
            onTap: () {
              // TODO: 跳转到设置页面
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('设置页面开发中')));
            },
          ),
          const Divider(height: 1, indent: 60),

          _buildMenuItem(
            icon: Icons.help_outline,
            title: '帮助与反馈',
            subtitle: '常见问题与意见反馈',
            onTap: () {
              // TODO: 跳转到帮助页面
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('帮助页面开发中')));
            },
          ),
          const Divider(height: 1, indent: 60),

          _buildMenuItem(
            icon: Icons.info_outline,
            title: '关于',
            subtitle: '版本信息与服务条款',
            onTap: () {
              _showAboutDialog();
            },
          ),
        ],
      ),
    );
  }

  // 菜单项
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.blue[600]),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
      onTap: onTap,
    );
  }

  // 退出登录按钮
  Widget _buildLogoutButton() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: OutlinedButton(
        onPressed: () => _showLogoutDialog(),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout),
            SizedBox(width: 8),
            Text(
              '退出登录',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  // 显示退出登录确认对话框
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('退出登录'),
        content: const Text('确定要退出登录吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () async {
              // 关闭对话框
              Navigator.pop(dialogContext);

              // 执行登出操作
              await AuthStore.logout();

              // 检查 widget 是否仍然存在，并保存 context
              if (!mounted) return;

              // 使用 State 的 context 进行导航
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            child: const Text('确定', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  // 显示关于对话框
  void _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationName: 'Hello Flutter',
      applicationVersion: '1.0.0',
      applicationIcon: Image.asset(
        'assets/images/xin.webp',
        width: 48,
        height: 48,
      ),
      children: [const Text('一个基于 Flutter 开发的示例应用')],
    );
  }
}
