import 'package:drift/drift.dart';
import 'package:news_app/data/database/article/articles_db_table.dart';
import 'package:news_app/data/database/local_database.dart';
import 'package:news_app/data/models/models_export.dart';

part 'article_table_dao.g.dart';

@DriftAccessor(tables: [ArticlesTable])
class ArticlesTableDao extends DatabaseAccessor<LocalDatabase>
    with _$ArticlesTableDaoMixin {
  ArticlesTableDao(LocalDatabase db) : super(db);

  Future<void> insertMultipleArticles(List<Articles> articlesList) async {
    await batch(
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
            publishedAt: articlesModel.publishedAt.toString(),
            imageUrl: Value(articlesModel.imageUrl),
            content: articlesModel.content,
          ),
        ),
        mode: InsertMode.insertOrIgnore,
      ),
    );
  }

  Future<List<Articles>> retrieveAllArticles(String source) async {
    List<Articles> sourceList = [];
    List<Articles> sourceListT = [];
    final dbData = await (select(articlesTable)
          ..where(
            (tbl) => tbl.sourceId.equals(source),
          ))
        .get();

    dbData.forEach((o) {
      sourceList.add(
        Articles(
          idAndName: Source(id: o.sourceId, name: o.sourceName),
          author: o.author,
          title: o.title,
          description: o.description,
          articleUrl: o.articleUrl,
          imageUrl: o.imageUrl!, //Uri.parse(o.imageUrl!),
          publishedAt: DateTime.parse(o.publishedAt),
          content: o.content,
        ),
      );
    });

    sourceListT = sourceList;
    return sourceListT;
  }
}
