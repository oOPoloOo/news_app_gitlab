import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/data/models/sources/sources_model.dart';

part 'sources_response.g.dart';

@JsonSerializable()
class SourcesResponse {
  SourcesResponse({required this.sourceList});

  @JsonKey(name: "sources")
  List<Sources> sourceList;

  factory SourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$SourcesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SourcesResponseToJson(this);
}
