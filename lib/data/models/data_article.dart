import 'package:json_annotation/json_annotation.dart';

part 'data_article.g.dart';

@JsonSerializable()
class DataArticle {
  late String title;
  String? author;
  late String description;
  late String urlToImage;
  DateTime? publishedAt;
  String? content;
  String? url;

  DataArticle(
      {required this.title,
      required this.description,
      this.author,
      this.content,
      this.publishedAt,
      required this.urlToImage,
      this.url});

  factory DataArticle.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
