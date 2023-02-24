import 'package:drift/drift.dart';
import 'package:news_app/articles/database/articles_db_table.dart';
import 'package:news_app/articles/model/articles_model.dart';
import 'package:news_app/articles/model/source/source_model.dart';
import 'package:news_app/common/database/local_database.dart';

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
    List<Articles> articleList = [];

    final dbData = await (select(articlesTable)
          ..where(
            (tbl) => tbl.sourceId.equals(source),
          ))
        .get();

    for (var o in dbData) {
      articleList.add(
        Articles(
            idAndName: Source(id: o.sourceId, name: o.sourceName),
            author: o.author,
            title: o.title,
            description: o.description,
            articleUrl: o.articleUrl,
            imageUrl: o.imageUrl,
            publishedAt: DateTime.parse(o.publishedAt),
            content: o.content,
            isFavourite: o.isFavourite),
      );
    }

    return articleList;
  }

  Future<void> updateMultipleFavArticles(List<Articles> articlesList) async {
    await batch(
      (batch) => batch.insertAllOnConflictUpdate(
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
            isFavourite: Value(articlesModel.isFavourite!),
          ),
        ),
      ),
    );
  }

  Future<List<Articles>> retrieveAllFavArticles() async {
    List<Articles> favArticlesList = [];

    final dbData = await (select(articlesTable)
          ..where(
            (tbl) => tbl.isFavourite,
          ))
        .get();

    for (var o in dbData) {
      favArticlesList.add(
        Articles(
          idAndName: Source(id: o.sourceId, name: o.sourceName),
          author: o.author,
          title: o.title,
          description: o.description,
          articleUrl: o.articleUrl,
          imageUrl: o.imageUrl,
          publishedAt: DateTime.parse(o.publishedAt),
          content: o.content,
          isFavourite: o.isFavourite,
        ),
      );
    }

    return favArticlesList;
  }
}
