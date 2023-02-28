import 'package:drift/drift.dart';
import 'package:news_app/common/database/local_database.dart';
import 'package:news_app/sources/database/sources_db_table.dart';
import 'package:news_app/sources/model/sources_model.dart';

part 'source_table_dao.g.dart';

@DriftAccessor(tables: [SourcesTable])
class SourcesTableDao extends DatabaseAccessor<LocalDatabase>
    with _$SourcesTableDaoMixin {
  SourcesTableDao(LocalDatabase db) : super(db);

  Future<void> insertMultipleSources(List<Sources> sourcesList) async {
    return batch(
      (batch) => batch.insertAll(
        sourcesTable,
        sourcesList.map(
          (sourcesModel) => SourcesTableCompanion.insert(
            sourceId: sourcesModel.id,
            title: sourcesModel.title,
            description: sourcesModel.description,
            url: Value(sourcesModel.url.toString()),
            category: sourcesModel.category,
            language: Value(sourcesModel.language),
            country: Value(sourcesModel.country),
          ),
        ),
        mode: InsertMode.insertOrIgnore,
      ),
    );
  }

  Stream<List<Sources>> watchSources() {
    return select(sourcesTable).watch().map((rows) {
      return rows.map((element) {
        return Sources(
          id: element.sourceId,
          title: element.title,
          description: element.description,
          url: element.url != null ? Uri.parse(element.url!) : null,
          category: element.category,
          language: element.language,
          country: element.country,
        );
      }).toList();
    });
  }
}
