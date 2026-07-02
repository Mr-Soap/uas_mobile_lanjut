import 'package:dio/dio.dart';
import '../../../../core/network/api_endpoint.dart';
import '../models/news_response_model.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponseModel> getTopHeadlines();
  Future<NewsResponseModel> searchNews(String query);
}

class NewsRemoteDataSourcesImpl implements NewsRemoteDataSource{
  final Dio dio;
  NewsRemoteDataSourcesImpl(this.dio);

  @override
  Future<NewsResponseModel> getTopHeadlines() async {
    final response = await dio.get(
      ApiEndpoints.topHeadlines,
      queryParameters: {
        'lang': 'en',
        'max': 10,
      },
    );
    return NewsResponseModel.fromJson(response.data);
  }

  @override
  Future<NewsResponseModel> searchNews(String query) async {
    final response = await dio.get(
      ApiEndpoints.search,
      queryParameters: {
        "q": query,
        "lang": "en",
        "max": 10,
      },
    );
    return NewsResponseModel.fromJson(response.data);
  }
}
