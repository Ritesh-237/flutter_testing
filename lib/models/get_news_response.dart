import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_news_response.g.dart';

@JsonSerializable()
class GetNewsResponse extends Equatable {
  final String status;
  final List<NewsArticle> articles;

  const GetNewsResponse({required this.status, required this.articles});

  factory GetNewsResponse.fromJson(Map<String, dynamic> map) =>
      _$GetNewsResponseFromJson(map);

  Map<String, dynamic> toJson() => _$GetNewsResponseToJson(this);

  @override
  List<Object?> get props => [status, articles];
}

@JsonSerializable()
class Source extends Equatable {
  final String? id;
  final String? name;

  const Source({this.id, this.name});
  factory Source.fromJson(Map<String, dynamic> map) => _$SourceFromJson(map);
  Map<String, dynamic> toJson() => _$SourceToJson(this);
  @override
  List<Object?> get props => [id, name];
}

@JsonSerializable()
class NewsArticle extends Equatable {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const NewsArticle(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
  factory NewsArticle.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleFromJson(json);
  Map<String, dynamic> toJson() => _$NewsArticleToJson(this);
  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];
}
