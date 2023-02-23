// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'source/source_model.dart';
import 'date_converter/date_converter.dart';

part 'articles_model.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class Articles {
  Articles({
    required this.idAndName,
    this.author,
    required this.title,
    this.description,
    required this.articleUrl,
    this.imageUrl,
    required this.publishedAt,
    required this.content,
  });
  @JsonKey(name: "source")
  Source idAndName;
  @JsonKey(name: "author")
  dynamic author;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "description")
  dynamic description;
  @JsonKey(name: "url")
  String articleUrl;
  @JsonKey(name: "urlToImage")
  dynamic imageUrl;
  @JsonKey(name: "publishedAt")
  DateTime publishedAt;
  @JsonKey(name: "content")
  String content;

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}
