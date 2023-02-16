import 'package:drift/drift.dart';
import 'package:news_app/data/database/article/articles_db_table.dart';
import 'package:news_app/data/database/dao/dao_export.dart';

import 'package:news_app/data/database/open_connection_local_db.dart';

import 'package:news_app/data/database/source/sources_db_table.dart';

part 'local_database.g.dart';

@DriftDatabase(
    tables: [SourcesTable, ArticlesTable],
    daos: [SourcesTableDao, ArticlesTableDao])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(connect());

  @override
  int get schemaVersion => 1;
}
