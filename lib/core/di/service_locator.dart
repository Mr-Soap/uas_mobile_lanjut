import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../network/dio_client.dart';
import '../../features/news/data/datasources/news_remote_datasources.dart';
import '../../features/news/domain/repositories/news_repository.dart';
import '../../features/news/data/repositories/news_repository_impl.dart';

final sl = GetIt.instance;

// init dependency
Future<void> initDependencies() async {
  sl.registerLazySingleton<Dio>(() => DioClient.create());
  sl.registerLazySingleton<NewsRemoteDataSource>(() => NewsRemoteDataSourcesImpl(sl<Dio>()));
  sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(sl<NewsRemoteDataSource>()));
}