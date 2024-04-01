import 'package:http/http.dart' as http;
import 'package:news_app_flutter/data/models/data_article.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsDataService {
  List<DataArticle> news = [];

  Future<List<DataArticle>> getNews() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&apiKey=${dotenv.env['api_key']}");

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (checkArticle(element)) {
          {
            DataArticle article = DataArticle.fromJson(element);
            news.add(article);
          }
        }
      });
    }
    return news;
  }
}

bool checkArticle(dynamic element) {
  return (element['urlToImage'] != null &&
      element['description'] != null &&
      element['title'] != null &&
      element['url'] != null);
}
