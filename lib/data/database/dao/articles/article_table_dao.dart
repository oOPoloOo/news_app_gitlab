import 'package:drift/drift.dart';
import 'package:news_app/data/database/article/articles_db_table.dart';
import 'package:news_app/data/database/local_database.dart';
import 'package:news_app/data/models/articles/articles_model.dart';

part 'article_table_dao.g.dart';

@DriftAccessor(tables: [ArticlesTable])
class ArticlesTableDao extends DatabaseAccessor<LocalDatabase>
    with _$ArticlesTableDaoMixin {
  ArticlesTableDao(LocalDatabase db) : super(db);

  Future<void> insertMultipleEntries(List<Articles> articlesList) async {
    return batch(
      (batch) => batch.insertAll(
        articlesTable,
        articlesList.map(
          (articlesModel) => ArticlesTableCompanion.insert(
            sourceId: articlesModel.idAndName.id,
            sourceName: articlesModel.idAndName.name,
            author: Value(articlesModel.author),
            title: articlesModel.title,
            description: Value(articlesModel.description),
            articleUrl: articlesModel.articleUrl,
            imageUrl: Value(articlesModel.imageUrl),
            content: articlesModel.content,
          ),
        ),

        //   onConflict: DoUpdate((old) => SetsTableCompanion.custom(isSelected: old.isSelected)),
      ),
    );
  }
}
