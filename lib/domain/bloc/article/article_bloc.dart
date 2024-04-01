import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_flutter/domain/service/favourite_service.dart';
import 'package:news_app_flutter/domain/model/article.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final FavouriteService favouriteService;

  ArticleBloc(this.favouriteService) : super(ArticleInitial()) {
    on<GetFavorite>((event, emit) {
      bool check = favouriteService.check(event.article);
      emit(GetFavourite(isFavourite: check));
    });
    on<ChangeFavorite>((event, emit) {
      bool check = favouriteService.check(event.article);
      if (check) {
        favouriteService.remove(event.article);
      } else {
        favouriteService.add(event.article);
      }
      emit(GetFavourite(isFavourite: check));
    });
  }
}
