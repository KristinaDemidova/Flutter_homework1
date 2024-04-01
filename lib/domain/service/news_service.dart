import 'package:news_app_flutter/domain/repository/news_repository.dart';
import 'package:news_app_flutter/domain/model/article.dart';
import 'package:get_it/get_it.dart';

class NewsService {
  Future<List<Article>> getNews() async {
    return GetIt.I<NewsRepository>().getNews();
  }
}
