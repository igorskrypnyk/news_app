import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/saved_provider.dart';

class SavedPage extends ConsumerWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saved = ref.watch(savedProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Збережені')),
      body: saved.isEmpty
          ? const Center(child: Text('Немає збережених статей'))
          : ListView.builder(
              itemCount: saved.length,
              itemBuilder: (context, index) {
                final article = saved[index];
                return ListTile(
                  title: Text(article.title, maxLines: 2, overflow: TextOverflow.ellipsis),
                  subtitle: Text(article.source),
                  trailing: IconButton(
                    icon: const Icon(Icons.bookmark, color: Colors.blue),
                    onPressed: () {
                      ref.read(savedProvider.notifier).toggle(article);
                    },
                  ),
                );
              },
            ),
    );
  }
}