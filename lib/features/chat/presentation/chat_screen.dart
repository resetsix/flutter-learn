import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI 聊天'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // 新建聊天
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text('对话 ${index + 1}'),
            subtitle: const Text(
              '最后一条消息...',
              style: TextStyle(fontSize: 13, color: Colors.blueGrey),
            ),
            trailing: const Text('12:30'),
            onTap: () async {
              await context.pushNamed(
                "chatDetail",
                pathParameters: {"id": "$index"},
              );
            },
          );
        },
      ),
    );
  }
}
