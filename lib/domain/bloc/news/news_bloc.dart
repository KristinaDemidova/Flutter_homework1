import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_flutter/domain/service/news_service.dart';
import 'package:news_app_flutter/domain/model/article.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsService newsService;

  NewsBloc(this.newsService) : super(NewsInitial()) {
    on<LoadNews>((event, emit) async {
      final articles = await newsService.getNews();
      emit(NewsLoaded(articles: articles));
    });
  }
}
