import 'package:get_it/get_it.dart';
import 'package:news_app_flutter/domain/repository/favourite_repository.dart';
import 'package:news_app_flutter/domain/model/article.dart';

class FavouriteService {
  void add(Article article) {
    GetIt.I<FavouriteRepository>().add(article);
  }

  void remove(Article article) {
    GetIt.I<FavouriteRepository>().remove(article);
  }

  List<Article> getFavourites() {
    return GetIt.I<FavouriteRepository>().getFavourites();
  }

  bool check(Article article) {
    return GetIt.I<FavouriteRepository>().check(article);
  }
}
