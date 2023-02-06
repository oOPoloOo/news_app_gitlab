import 'package:json_annotation/json_annotation.dart';
import 'date_converter/date_converter.dart';

part 'articles_model.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class Articles {
  Articles({
    required this.id,
    required this.name,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "author")
  dynamic author;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "url")
  String url;
  @JsonKey(name: "urlToImage")
  String urlToImage;
  @JsonKey(name: "publishedAt")
  DateTime publishedAt;
  @JsonKey(name: "content")
  String content;

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}
