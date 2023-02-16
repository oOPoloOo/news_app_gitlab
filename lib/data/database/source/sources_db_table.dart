import 'package:drift/drift.dart';

class SourcesTable extends Table {
  // IntColumn get id => integer().autoIncrement()();

  TextColumn get sourceId => text().named('source_id')();
  TextColumn get title => text().named('name')();
  TextColumn get description => text().named('description')();
  TextColumn get url => text().named('url').nullable()();
  TextColumn get category => text().named('category')();
  TextColumn get language => text().named('language').nullable()();
  TextColumn get country => text().named('country').nullable()();

  @override
  Set<Column> get primaryKey => {url};
}
