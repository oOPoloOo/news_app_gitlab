// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Articles _$ArticlesFromJson(Map<String, dynamic> json) => Articles(
      idAndName: Source.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'],
      title: json['title'] as String,
      description: json['description'],
      articleUrl: json['url'] as String,
      imageUrl: json['urlToImage'],
      publishedAt: const CustomDateTimeConverter()
          .fromJson(json['publishedAt'] as String),
      content: json['content'] as String,
    );

Map<String, dynamic> _$ArticlesToJson(Articles instance) => <String, dynamic>{
      'source': instance.idAndName,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.articleUrl,
      'urlToImage': instance.imageUrl,
      'publishedAt':
          const CustomDateTimeConverter().toJson(instance.publishedAt),
      'content': instance.content,
    };
