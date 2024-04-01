import 'package:news_app_flutter/data/api/api_utils.dart';
import 'package:news_app_flutter/domain/repository/news_repository.dart';
import 'package:news_app_flutter/domain/model/article.dart';

class NewsDataRepository extends NewsRepository {
  final ApiUtil _apiUtil;

  NewsDataRepository(this._apiUtil);

  @override
  Future<List<Article>> getNews() async {
    return _apiUtil.getNews();
  }
}
