import '../entities/article.dart';
import '../repositories/news_repository.dart';

class SearchNewsUsecase {
  final NewsRepository repository;
  SearchNewsUsecase(this.repository);

  Future<List<Article>> call(String query) {
    return repository.searchNews(query);
  }
}