class Article {
  final String title;
  final String description;
  final String content;
  final String image;
  final String url;
  final DateTime publishedAt;
  final String sourceName;

  const Article ({
    required this.title,
    required this.description,
    required this.content,
    required this.image,
    required this.url,
    required this.publishedAt,
    required this.sourceName,
  });
}