import 'package:news_app_flutter/domain/model/article.dart';

abstract class FavouriteRepository {
  void add(Article article);
  void remove(Article article);
  bool check(Article article);
  List<Article> getFavourites();
}
