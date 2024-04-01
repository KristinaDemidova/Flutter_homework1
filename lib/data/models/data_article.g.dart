// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataArticle _$ArticleFromJson(Map<String, dynamic> json) => DataArticle(
      title: json['title'] as String,
      description: json['description'] as String,
      author: json['author'] as String?,
      content: json['content'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      urlToImage: json['urlToImage'] as String,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ArticleToJson(DataArticle instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'content': instance.content,
      'url': instance.url,
    };
