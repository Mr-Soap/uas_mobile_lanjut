import 'package:dio/dio.dart';
import '../../../../core/network/api_endpoint.dart';
import '../models/news_response_model.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponseModel> getTopHeadlines();
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
}
