import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Source {
  Source({
    required this.id,
    required this.name,
  });

  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "name")
  String name;
}
