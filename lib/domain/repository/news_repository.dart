import 'package:news_app_flutter/domain/model/article.dart';

abstract class NewsRepository {
  Future<List<Article>> getNews();
}
