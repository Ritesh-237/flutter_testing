// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNewsResponse _$GetNewsResponseFromJson(Map<String, dynamic> json) =>
    GetNewsResponse(
      status: json['status'] as String,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => NewsArticle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetNewsResponseToJson(GetNewsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'articles': instance.articles,
    };

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

NewsArticle _$NewsArticleFromJson(Map<String, dynamic> json) => NewsArticle(
      source: json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$NewsArticleToJson(NewsArticle instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
