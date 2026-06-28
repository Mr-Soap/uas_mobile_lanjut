import '../../domain/entities/article.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_remote_datasources.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  NewsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Article>> getTopHeadlines() async {
    final response = await remoteDataSource.getTopHeadlines();
    final articles = response.articles;

    articles.sort(
      (a, b) => b.title.compareTo(a.title),
    );

    return articles;
  }
}