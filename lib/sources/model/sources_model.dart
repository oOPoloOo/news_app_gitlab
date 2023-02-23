// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'sources_model.g.dart';

@JsonSerializable()
class Sources {
  Sources({
    required this.id,
    required this.title,
    required this.description,
    this.url,
    required this.category,
    this.language,
    this.country,
  });

  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "name")
  String title;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "url")
  Uri? url;
  @JsonKey(name: "category")
  String category;
  @JsonKey(name: "language")
  String? language;
  @JsonKey(name: "country")
  String? country;

  factory Sources.fromJson(Map<String, dynamic> json) =>
      _$SourcesFromJson(json);

  Map<String, dynamic> toJson() => _$SourcesToJson(this);
}
