import '../../domain/entities/article.dart';

class ArticleModel extends Article {
  const ArticleModel ({
    required super.title,
    required super.description,
    required super.content,
    required super.image,
    required super.url,
    required super.publishedAt,
    required super.sourceName,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      content: json['content'] ?? '',
      image: json['image'] ?? '',
      url: json['url'] ?? '',
      publishedAt: DateTime.parse(json['publishedAt']),
      sourceName: json['source']['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'content': content,
      'image': image,
      'url': url,
      'publishedAt': publishedAt.toIso8601String(),
      'source': {
        'name': sourceName,
      },
    };
  }
}