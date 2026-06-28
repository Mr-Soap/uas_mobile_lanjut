import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_top_headlines.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetTopHeadlines getTopHeadlines;

  NewsBloc (this.getTopHeadlines) : super(const NewsInitial()) {
    on<GetTopHeadlinesEvent>(_onGetTopHeadlines);
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
}