import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/article.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final newsProvider = FutureProvider<List<Article>>((ref) async {
  final dio = ref.read(dioProvider);
  final response = await dio.get(
    'https://newsapi.org/v2/top-headlines',
    queryParameters: {
      'country': 'us',
      'apiKey': 'ad1f52f9cdab4134829949d3ddce908a',
    },
  );
  return (response.data['articles'] as List)
      .map((json) => Article.fromJson(json))
      .toList();
});