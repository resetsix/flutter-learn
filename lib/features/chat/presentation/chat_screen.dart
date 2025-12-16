import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_flutter/providers/talker_provider.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI 聊天'),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () async {}),
        ],
      ),
      // body: const PageD(),
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
              final talk = ref.read(talkerProvider);

              talk.info("Hello");
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
