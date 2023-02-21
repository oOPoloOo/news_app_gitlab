import 'package:drift/drift.dart';

class ArticlesTable extends Table {
  //IntColumn get id => integer().autoIncrement()();
  TextColumn get sourceId => text().named('source_id')();
  TextColumn get sourceName => text().named('source_name')();
  TextColumn get author => text().named('author').nullable()();
  TextColumn get title => text().named('title')();
  TextColumn get description => text().named('description').nullable()();
  TextColumn get articleUrl => text().named('url')();
  TextColumn get imageUrl => text().named('urlToImage').nullable()();
  TextColumn get publishedAt => text().named('publishedAt')();
  TextColumn get content => text().named('content')();

  @override
  Set<Column> get primaryKey => {articleUrl};
}
