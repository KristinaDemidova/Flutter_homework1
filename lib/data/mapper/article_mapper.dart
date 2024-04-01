import 'package:news_app_flutter/data/models/data_article.dart';
import 'package:news_app_flutter/domain/model/article.dart';

class ArticleMapper {
  static Article map(DataArticle dataArticle) {
    return Article(
        title: dataArticle.title,
        description: dataArticle.description,
        url: dataArticle.url,
        urlToImage: dataArticle.urlToImage,
        publishedAt: dataArticle.publishedAt,
        content: dataArticle.content);
  }

  static List<Article> mapList(List<DataArticle> dataArticles) {
    List<Article> articles = [];
    for (DataArticle dataArticle in dataArticles) {
      articles.add(map(dataArticle));
    }
    return articles;
  }
}
