// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import 'package:news_app/sources/model/sources_model.dart';

part 'sources_response_model.g.dart';

@JsonSerializable()
class SourcesResponse {
  SourcesResponse({required this.sourceList});

  @JsonKey(name: "sources")
  List<Sources> sourceList;

  factory SourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$SourcesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SourcesResponseToJson(this);
}
