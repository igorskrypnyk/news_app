import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/article.dart';

class SavedNotifier extends Notifier<List<Article>> {
  static const _key = 'saved_articles';

  @override
  List<Article> build() {
    _load();
    return [];
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);
    if (data != null) {
      final list = jsonDecode(data) as List;
      state = list.map((json) => Article.fromJson(json)).toList();
    }
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(state.map((a) => a.toJson()).toList());
    await prefs.setString(_key, data);
  }

  void toggle(Article article) {
    if (isSaved(article)) {
      state = state.where((a) => a.id != article.id).toList();
    } else {
      state = [...state, article];
    }
    _save();
  }

  bool isSaved(Article article) {
    return state.any((a) => a.id == article.id);
  }
}

final savedProvider = NotifierProvider<SavedNotifier, List<Article>>(
  SavedNotifier.new,
);