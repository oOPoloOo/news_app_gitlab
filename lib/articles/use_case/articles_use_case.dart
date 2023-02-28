import 'package:dio/dio.dart';
import 'package:news_app/articles/model/articles_model.dart';
import 'package:news_app/articles/model/articles_response_model.dart';
import 'package:news_app/articles/services/articles_service.dart';
import 'package:news_app/articles/use_case/base_articles_use_case.dart';
import 'package:news_app/common/api/api_client.dart';
import 'package:news_app/common/database/local_database.dart';
import 'package:news_app/common/services/api_config/api_const.dart';

class ArticlesUseCase extends BaseArticlesUseCase {
  late Dio apiClient;
  ArticleService articleService = ArticleService();
  LocalDatabase localDatabase = LocalDatabase();

  ArticlesUseCase() {
    apiClient = newsClient();
  }

  @override
  Future<void> loadArticlesBySource(String source) async {
    Response response;
    List<Articles> articlesList;
    ArticlesResponse articlesResp;
    String newArticles = "$articlesTen&sources=$source";

    try {
      response = await articleService.getArticles(apiClient, newArticles);
      if (response.statusCode == 200) {
        articlesResp = ArticlesResponse.fromJson(response.data);
        articlesList = articlesResp.artileList;
        await localDatabase.articlesTableDao
            .insertMultipleArticles(articlesList);
      }
    } on DioError catch (e) {
      logger.e(e.message);
    }
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
