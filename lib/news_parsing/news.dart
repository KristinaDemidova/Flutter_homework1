import 'package:http/http.dart' as http;
import 'package:news_app_flutter/models/article.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&apiKey=${dotenv.env['api_key']}");

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['title'] != null &&
            element['url'] != null) {
          {
            Article article = Article.fromJson(element);
            news.add(article);
          }
        }
      });
    }
  }
}
