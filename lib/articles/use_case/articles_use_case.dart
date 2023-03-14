import 'package:news_app/articles/model/articles_model.dart';
import 'package:news_app/articles/services/articles_service.dart';
import 'package:news_app/articles/use_case/base_articles_use_case.dart';
import 'package:news_app/common/database/local_database.dart';
import 'package:news_app/common/services/api_config/api_const.dart';

class ArticlesUseCase extends BaseArticlesUseCase {
  ArticleService articleService = ArticleService();
  LocalDatabase localDatabase = LocalDatabase();

  @override
  Future<void> loadArticlesBySource(String source) async {
    List<Articles> articlesList;
    String newArticles = "$articlesTen&sources=$source";

    articlesList = await articleService.getArticles(newArticles);

    await localDatabase.articlesTableDao.insertMultipleArticles(articlesList);
  }

  @override
  Stream<List<Articles>> watch(String source) {
    return localDatabase.articlesTableDao.watchArticles(source);
  }

  @override
  Future<List<Articles>> readAllFavArticlesFromLocalDb() async {
    final articlesList =
        await localDatabase.articlesTableDao.retrieveAllFavArticles();

    return articlesList;
  }

  @override
  Future<void> updateAllMultipleFavArticles(
      List<Articles> favArticleList) async {
    await localDatabase.articlesTableDao
        .updateMultipleFavArticles(favArticleList);
  }
}
