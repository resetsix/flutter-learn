import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI 创作')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _CreationCard(
            icon: Icons.image,
            title: '图片生成',
            subtitle: 'AI 绘画',
            onTap: () {},
          ),
          _CreationCard(
            icon: Icons.article,
            title: '文章写作',
            subtitle: '智能创作',
            onTap: () {},
          ),
          _CreationCard(
            icon: Icons.code,
            title: '代码生成',
            subtitle: '编程助手',
            onTap: () {},
          ),
          _CreationCard(
            icon: Icons.translate,
            title: '翻译',
            subtitle: '多语言翻译',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _CreationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _CreationCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48),
              const SizedBox(height: 12),
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
