import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_flutter/domain/service/favourite_service.dart';
import 'package:news_app_flutter/domain/model/article.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavouriteService favouriteService;

  FavouriteBloc(this.favouriteService) : super(FavouriteInitial()) {
    on<LoadFavourites>((event, emit) async {
      final articles = favouriteService.getFavourites();
      emit(FavouriteLoaded(articles: articles));
    });
  }
}
