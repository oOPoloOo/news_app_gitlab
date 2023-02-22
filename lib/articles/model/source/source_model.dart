import 'package:json_annotation/json_annotation.dart';

part 'source_model.g.dart';

@JsonSerializable()
class Source {
  Source({
    required this.id,
    required this.name,
  });

  @JsonKey(name: "id")
  dynamic id;
  @JsonKey(name: "name")
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
