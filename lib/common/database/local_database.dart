import 'package:drift/drift.dart';
import 'package:news_app/articles/database/articles_db_table.dart';
import 'package:news_app/articles/database/dao/article_table_dao.dart';
import 'connection/connection.dart' as impl;
import 'package:news_app/sources/database/dao/source_table_dao.dart';

import 'package:news_app/sources/database/sources_db_table.dart';
part 'local_database.g.dart';

@DriftDatabase(
    tables: [SourcesTable, ArticlesTable],
    daos: [SourcesTableDao, ArticlesTableDao])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(impl.connect());

  @override
  int get schemaVersion => 1;
}
