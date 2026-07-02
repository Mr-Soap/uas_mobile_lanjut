import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uas_mobile_lanjut/features/news/domain/usecases/search_news_usecase.dart';
import '../../domain/usecases/get_top_headlines.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetTopHeadlines getTopHeadlines;
  final SearchNewsUsecase searchNewsUsecase;
  
  NewsBloc (
    this.getTopHeadlines,
    this.searchNewsUsecase,
      ) : super(NewsInitial()) {
    on<GetTopHeadlinesEvent>(_onGetTopHeadlines);
    on<SearchNewsEvent>(_onSearchNews);
  }

  Future<void> _onGetTopHeadlines(
    GetTopHeadlinesEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(const NewsLoading());

    try {
      final articles = await getTopHeadlines();
      emit(NewsLoaded(articles));
    } catch (e) {
      emit(
        NewsError(e.toString()),
      );
    }
  }

  Future<void> _onSearchNews(
    SearchNewsEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(const NewsLoading());
    try {
      final articles = await searchNewsUsecase(
        event.query,
      );
      emit(
        NewsLoaded(articles),
      );
    } catch (e) {
      emit(
        NewsError(e.toString()),
      );
    }
  } 
}