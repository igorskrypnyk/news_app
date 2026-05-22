class Article {
  final String id;
  final String title;
  final String description;
  final String url;
  final String? imageUrl;
  final String source;
  final DateTime publishedAt;

  Article({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    this.imageUrl,
    required this.source,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['url'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      imageUrl: json['urlToImage'],
      source: json['source']['name'] ?? '',
      publishedAt: DateTime.parse(json['publishedAt']),
    );
  }

  Map<String, dynamic> toJson() {
  return {
    'url': url,
    'title': title,
    'description': description,
    'urlToImage': imageUrl,
    'source': {'name': source},
    'publishedAt': publishedAt.toIso8601String(),
  };
}
}