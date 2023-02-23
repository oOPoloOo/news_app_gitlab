// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/articles/model/articles_model.dart';

part 'articles_response_model.g.dart';

@JsonSerializable()
class ArticlesResponse {
  ArticlesResponse({
    required this.artileList,
  });

  @JsonKey(name: "articles")
  List<Articles> artileList;

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesResponseToJson(this);
}
