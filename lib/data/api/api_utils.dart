import 'package:news_app_flutter/data/api/service/news_service.dart';
import 'package:news_app_flutter/data/mapper/article_mapper.dart';
import 'package:news_app_flutter/domain/model/article.dart';

class ApiUtil {
  final NewsDataService _newsService;

  ApiUtil(this._newsService);

  Future<List<Article>> getNews() async {
    return ArticleMapper.mapList(await _newsService.getNews());
  }
}
