import 'package:drift/drift.dart';
import 'package:news_app/data/database/local_database.dart';
import 'package:news_app/data/database/source/sources_db_table.dart';
import 'package:news_app/data/models/sources/sources_model.dart';

part 'source_table_dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [SourcesTable])
class SourcesTableDao extends DatabaseAccessor<LocalDatabase>
    with _$SourcesTableDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  SourcesTableDao(LocalDatabase db) : super(db);

//   Future<void> insertMultipleEntries(List<Sources> sourcesList) async {
//     await batch((batch) {
//       // functions in a batch don't have to be awaited - just
//       // await the whole batch afterwards.

//       //  sourcesList.forEach((val) {
//       batch.insertAll(
//         SourcesTable as TableInfo<Table, SourcesTableData>,

//           sourcesList.forEach((sourcesModel) {
  // SourcesTableCompanion.insert(
  //   sourceId: sourcesModel.id,
  //   title: sourcesModel.title,
  //   description: sourcesModel.description,
  //   url: Value(sourcesModel.url as String?),
  //   category: sourcesModel.category,
  //   language: Value(sourcesModel.language),
  //   country: Value(sourcesModel.country),
  // );
//           })

//       );
//       // });
//     });
//   }
// }

  Future<void> insertMultipleEntries(List<Sources> sourcesList) async {
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

        //   onConflict: DoUpdate((old) => SetsTableCompanion.custom(isSelected: old.isSelected)),
      ),
    );
  }

// SourcesTableCompanion.insert(
//       sourceId: sourcesModel.id,
//       title: sourcesModel.title,
//       description: sourcesModel.description,
//       url: Value(sourcesModel.url as String?),
//       category: sourcesModel.category,
//       language: Value(sourcesModel.language),
//       country: Value(sourcesModel.country),
//     ),
}
