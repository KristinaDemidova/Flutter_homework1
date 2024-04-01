import 'package:news_app_flutter/domain/repository/favourite_repository.dart';
import 'package:news_app_flutter/domain/model/article.dart';

class FavouriteDataRepository extends FavouriteRepository {
  late Set<Article> favourites;

  FavouriteDataRepository() : favourites = {};

  @override
  add(Article article) {
    favourites.add(article);
  }

  @override
  bool check(Article article) {
    return favourites.contains(article);
  }

  @override
  List<Article> getFavourites() {
    return favourites.toList();
  }

  @override
  remove(Article article) {
    favourites.remove(article);
  }
}
