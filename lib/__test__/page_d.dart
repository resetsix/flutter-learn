import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_flutter/models/user.dart';
import 'package:hello_flutter/service/user_service.dart';

class PageD extends StatefulWidget {
  const PageD({super.key});

  @override
  State<PageD> createState() => _PageDState();
}

class _PageDState extends State<PageD> {
  UserRes? _user;
  final userService = UserService();

  @override
  void initState() {
    super.initState();
    // ignore: discarded_futures
    _fetchUser();
  }

  Future<void> _fetchUser() async {
    final res = await userService.getUser();
    if (!mounted) return;
    setState(() => _user = res);
  }

  Widget _buildPostsList() {
    final posts = _user?.posts ?? [];

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return ListTile(
          leading: CircleAvatar(child: Text('${post.id}')),
          title: Text(post.title ?? 'No title'),
          subtitle: Text('Post ID: ${post.id}'),
          trailing: Text('${post.id}'),
          onTap: () async {
            await context.pushNamed(
              'chatDetail',
              pathParameters: {'id': post.id.toString()},
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _user == null
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(body: _buildPostsList());
  }
}
