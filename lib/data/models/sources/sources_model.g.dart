// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sources_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sources _$SourcesFromJson(Map<String, dynamic> json) => Sources(
      id: json['id'] as String,
      title: json['name'] as String,
      description: json['description'] as String,
      url: json['url'] == null ? null : Uri.parse(json['url'] as String),
      category: json['category'] as String,
      language: json['language'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$SourcesToJson(Sources instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.title,
      'description': instance.description,
      'url': instance.url?.toString(),
      'category': instance.category,
      'language': instance.language,
      'country': instance.country,
    };
