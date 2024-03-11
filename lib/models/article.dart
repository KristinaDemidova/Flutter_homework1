import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  late String title;
  String? author;
  late String description;
  late String urlToImage;
  DateTime? publishedAt;
  String? content;
  String? url;

  Article(
      {required this.title,
      required this.description,
      this.author,
      this.content,
      this.publishedAt,
      required this.urlToImage,
      this.url});

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
