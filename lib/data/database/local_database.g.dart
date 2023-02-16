// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// ignore_for_file: type=lint
class $SourcesTableTable extends SourcesTable
    with TableInfo<$SourcesTableTable, SourcesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourcesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sourceIdMeta =
      const VerificationMeta('sourceId');
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
      'source_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [sourceId, title, description, url, category, language, country];
  @override
  String get aliasedName => _alias ?? 'sources_table';
  @override
  String get actualTableName => 'sources_table';
  @override
  VerificationContext validateIntegrity(Insertable<SourcesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('source_id')) {
      context.handle(_sourceIdMeta,
          sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta));
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['name']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {url};
  @override
  SourcesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SourcesTableData(
      sourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language']),
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country']),
    );
  }

  @override
  $SourcesTableTable createAlias(String alias) {
    return $SourcesTableTable(attachedDatabase, alias);
  }
}

class SourcesTableData extends DataClass
    implements Insertable<SourcesTableData> {
  final String sourceId;
  final String title;
  final String description;
  final String? url;
  final String category;
  final String? language;
  final String? country;
  const SourcesTableData(
      {required this.sourceId,
      required this.title,
      required this.description,
      this.url,
      required this.category,
      this.language,
      this.country});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['source_id'] = Variable<String>(sourceId);
    map['name'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    return map;
  }

  SourcesTableCompanion toCompanion(bool nullToAbsent) {
    return SourcesTableCompanion(
      sourceId: Value(sourceId),
      title: Value(title),
      description: Value(description),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      category: Value(category),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
    );
  }

  factory SourcesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SourcesTableData(
      sourceId: serializer.fromJson<String>(json['sourceId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      url: serializer.fromJson<String?>(json['url']),
      category: serializer.fromJson<String>(json['category']),
      language: serializer.fromJson<String?>(json['language']),
      country: serializer.fromJson<String?>(json['country']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sourceId': serializer.toJson<String>(sourceId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'url': serializer.toJson<String?>(url),
      'category': serializer.toJson<String>(category),
      'language': serializer.toJson<String?>(language),
      'country': serializer.toJson<String?>(country),
    };
  }

  SourcesTableData copyWith(
          {String? sourceId,
          String? title,
          String? description,
          Value<String?> url = const Value.absent(),
          String? category,
          Value<String?> language = const Value.absent(),
          Value<String?> country = const Value.absent()}) =>
      SourcesTableData(
        sourceId: sourceId ?? this.sourceId,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url.present ? url.value : this.url,
        category: category ?? this.category,
        language: language.present ? language.value : this.language,
        country: country.present ? country.value : this.country,
      );
  @override
  String toString() {
    return (StringBuffer('SourcesTableData(')
          ..write('sourceId: $sourceId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('category: $category, ')
          ..write('language: $language, ')
          ..write('country: $country')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      sourceId, title, description, url, category, language, country);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SourcesTableData &&
          other.sourceId == this.sourceId &&
          other.title == this.title &&
          other.description == this.description &&
          other.url == this.url &&
          other.category == this.category &&
          other.language == this.language &&
          other.country == this.country);
}

class SourcesTableCompanion extends UpdateCompanion<SourcesTableData> {
  final Value<String> sourceId;
  final Value<String> title;
  final Value<String> description;
  final Value<String?> url;
  final Value<String> category;
  final Value<String?> language;
  final Value<String?> country;
  const SourcesTableCompanion({
    this.sourceId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
    this.category = const Value.absent(),
    this.language = const Value.absent(),
    this.country = const Value.absent(),
  });
  SourcesTableCompanion.insert({
    required String sourceId,
    required String title,
    required String description,
    this.url = const Value.absent(),
    required String category,
    this.language = const Value.absent(),
    this.country = const Value.absent(),
  })  : sourceId = Value(sourceId),
        title = Value(title),
        description = Value(description),
        category = Value(category);
  static Insertable<SourcesTableData> custom({
    Expression<String>? sourceId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? url,
    Expression<String>? category,
    Expression<String>? language,
    Expression<String>? country,
  }) {
    return RawValuesInsertable({
      if (sourceId != null) 'source_id': sourceId,
      if (title != null) 'name': title,
      if (description != null) 'description': description,
      if (url != null) 'url': url,
      if (category != null) 'category': category,
      if (language != null) 'language': language,
      if (country != null) 'country': country,
    });
  }

  SourcesTableCompanion copyWith(
      {Value<String>? sourceId,
      Value<String>? title,
      Value<String>? description,
      Value<String?>? url,
      Value<String>? category,
      Value<String?>? language,
      Value<String?>? country}) {
    return SourcesTableCompanion(
      sourceId: sourceId ?? this.sourceId,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      category: category ?? this.category,
      language: language ?? this.language,
      country: country ?? this.country,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (title.present) {
      map['name'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SourcesTableCompanion(')
          ..write('sourceId: $sourceId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('category: $category, ')
          ..write('language: $language, ')
          ..write('country: $country')
          ..write(')'))
        .toString();
  }
}

class $ArticlesTableTable extends ArticlesTable
    with TableInfo<$ArticlesTableTable, ArticlesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticlesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sourceIdMeta =
      const VerificationMeta('sourceId');
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
      'source_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceNameMeta =
      const VerificationMeta('sourceName');
  @override
  late final GeneratedColumn<String> sourceName = GeneratedColumn<String>(
      'source_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _articleUrlMeta =
      const VerificationMeta('articleUrl');
  @override
  late final GeneratedColumn<String> articleUrl = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'urlToImage', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        sourceId,
        sourceName,
        author,
        title,
        description,
        articleUrl,
        imageUrl,
        content
      ];
  @override
  String get aliasedName => _alias ?? 'articles_table';
  @override
  String get actualTableName => 'articles_table';
  @override
  VerificationContext validateIntegrity(Insertable<ArticlesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('source_id')) {
      context.handle(_sourceIdMeta,
          sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta));
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('source_name')) {
      context.handle(
          _sourceNameMeta,
          sourceName.isAcceptableOrUnknown(
              data['source_name']!, _sourceNameMeta));
    } else if (isInserting) {
      context.missing(_sourceNameMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('url')) {
      context.handle(_articleUrlMeta,
          articleUrl.isAcceptableOrUnknown(data['url']!, _articleUrlMeta));
    } else if (isInserting) {
      context.missing(_articleUrlMeta);
    }
    if (data.containsKey('urlToImage')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['urlToImage']!, _imageUrlMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {articleUrl};
  @override
  ArticlesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArticlesTableData(
      sourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_id'])!,
      sourceName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_name'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      articleUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}urlToImage']),
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
    );
  }

  @override
  $ArticlesTableTable createAlias(String alias) {
    return $ArticlesTableTable(attachedDatabase, alias);
  }
}

class ArticlesTableData extends DataClass
    implements Insertable<ArticlesTableData> {
  final String sourceId;
  final String sourceName;
  final String? author;
  final String title;
  final String? description;
  final String articleUrl;
  final String? imageUrl;
  final String content;
  const ArticlesTableData(
      {required this.sourceId,
      required this.sourceName,
      this.author,
      required this.title,
      this.description,
      required this.articleUrl,
      this.imageUrl,
      required this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['source_id'] = Variable<String>(sourceId);
    map['source_name'] = Variable<String>(sourceName);
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['url'] = Variable<String>(articleUrl);
    if (!nullToAbsent || imageUrl != null) {
      map['urlToImage'] = Variable<String>(imageUrl);
    }
    map['content'] = Variable<String>(content);
    return map;
  }

  ArticlesTableCompanion toCompanion(bool nullToAbsent) {
    return ArticlesTableCompanion(
      sourceId: Value(sourceId),
      sourceName: Value(sourceName),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      articleUrl: Value(articleUrl),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      content: Value(content),
    );
  }

  factory ArticlesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArticlesTableData(
      sourceId: serializer.fromJson<String>(json['sourceId']),
      sourceName: serializer.fromJson<String>(json['sourceName']),
      author: serializer.fromJson<String?>(json['author']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      articleUrl: serializer.fromJson<String>(json['articleUrl']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sourceId': serializer.toJson<String>(sourceId),
      'sourceName': serializer.toJson<String>(sourceName),
      'author': serializer.toJson<String?>(author),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'articleUrl': serializer.toJson<String>(articleUrl),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'content': serializer.toJson<String>(content),
    };
  }

  ArticlesTableData copyWith(
          {String? sourceId,
          String? sourceName,
          Value<String?> author = const Value.absent(),
          String? title,
          Value<String?> description = const Value.absent(),
          String? articleUrl,
          Value<String?> imageUrl = const Value.absent(),
          String? content}) =>
      ArticlesTableData(
        sourceId: sourceId ?? this.sourceId,
        sourceName: sourceName ?? this.sourceName,
        author: author.present ? author.value : this.author,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        articleUrl: articleUrl ?? this.articleUrl,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        content: content ?? this.content,
      );
  @override
  String toString() {
    return (StringBuffer('ArticlesTableData(')
          ..write('sourceId: $sourceId, ')
          ..write('sourceName: $sourceName, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('articleUrl: $articleUrl, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(sourceId, sourceName, author, title,
      description, articleUrl, imageUrl, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticlesTableData &&
          other.sourceId == this.sourceId &&
          other.sourceName == this.sourceName &&
          other.author == this.author &&
          other.title == this.title &&
          other.description == this.description &&
          other.articleUrl == this.articleUrl &&
          other.imageUrl == this.imageUrl &&
          other.content == this.content);
}

class ArticlesTableCompanion extends UpdateCompanion<ArticlesTableData> {
  final Value<String> sourceId;
  final Value<String> sourceName;
  final Value<String?> author;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> articleUrl;
  final Value<String?> imageUrl;
  final Value<String> content;
  const ArticlesTableCompanion({
    this.sourceId = const Value.absent(),
    this.sourceName = const Value.absent(),
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.articleUrl = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.content = const Value.absent(),
  });
  ArticlesTableCompanion.insert({
    required String sourceId,
    required String sourceName,
    this.author = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required String articleUrl,
    this.imageUrl = const Value.absent(),
    required String content,
  })  : sourceId = Value(sourceId),
        sourceName = Value(sourceName),
        title = Value(title),
        articleUrl = Value(articleUrl),
        content = Value(content);
  static Insertable<ArticlesTableData> custom({
    Expression<String>? sourceId,
    Expression<String>? sourceName,
    Expression<String>? author,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? articleUrl,
    Expression<String>? imageUrl,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (sourceId != null) 'source_id': sourceId,
      if (sourceName != null) 'source_name': sourceName,
      if (author != null) 'author': author,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (articleUrl != null) 'url': articleUrl,
      if (imageUrl != null) 'urlToImage': imageUrl,
      if (content != null) 'content': content,
    });
  }

  ArticlesTableCompanion copyWith(
      {Value<String>? sourceId,
      Value<String>? sourceName,
      Value<String?>? author,
      Value<String>? title,
      Value<String?>? description,
      Value<String>? articleUrl,
      Value<String?>? imageUrl,
      Value<String>? content}) {
    return ArticlesTableCompanion(
      sourceId: sourceId ?? this.sourceId,
      sourceName: sourceName ?? this.sourceName,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      articleUrl: articleUrl ?? this.articleUrl,
      imageUrl: imageUrl ?? this.imageUrl,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (sourceName.present) {
      map['source_name'] = Variable<String>(sourceName.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (articleUrl.present) {
      map['url'] = Variable<String>(articleUrl.value);
    }
    if (imageUrl.present) {
      map['urlToImage'] = Variable<String>(imageUrl.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesTableCompanion(')
          ..write('sourceId: $sourceId, ')
          ..write('sourceName: $sourceName, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('articleUrl: $articleUrl, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $SourcesTableTable sourcesTable = $SourcesTableTable(this);
  late final $ArticlesTableTable articlesTable = $ArticlesTableTable(this);
  late final SourcesTableDao sourcesTableDao =
      SourcesTableDao(this as LocalDatabase);
  late final ArticlesTableDao articlesTableDao =
      ArticlesTableDao(this as LocalDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [sourcesTable, articlesTable];
}
