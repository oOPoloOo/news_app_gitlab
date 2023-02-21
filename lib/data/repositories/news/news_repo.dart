import 'package:dio/dio.dart';
import 'package:news_app/data/api/api_client.dart';
import 'package:news_app/data/database/local_database.dart';
import 'package:news_app/data/models/models_export.dart';
import 'package:news_app/data/services/api/api_service.dart';
import 'package:news_app/data/services/api_config/api_const.dart';

import 'base_news_repo.dart';

class NewsRepository extends BaseNewsRepository {
  late Dio apiClient;
  ApiService apiService = ApiService();
  LocalDatabase localDatabase = LocalDatabase();

  NewsRepository() {
    apiClient = newsClient();
  }

  @override
  Future<List<Sources>> getAllSourcesByTechnologyEn() async {
    Response response;
    List<Sources> sourceList;
    SourcesResponse sourcesResp;

    try {
      response = await apiService.getSourcesEn(apiClient, sourcesTechnologyEn);
      if (response.statusCode == 200) {
        sourcesResp = SourcesResponse.fromJson(response.data);
        sourceList = sourcesResp.sourceList;
        return sourceList;
      }
    } on DioError catch (e) {
      logger.e(e.message);
    }
    throw Exception(
        "Somethig went wrong! StatusCode != 200. getAllSourcesByTechnologyEn.");
  }

  @override
  Future<List<Articles>> getAllArticlesBySource(String source) async {
    Response response;
    List<Articles> articlesList;
    ArticlesResponse articlesResp;
    String newArticles = "$articlesTen&sources=$source";

    try {
      response = await apiService.getArticles(apiClient, newArticles);
      if (response.statusCode == 200) {
        articlesResp = ArticlesResponse.fromJson(response.data);
        articlesList = articlesResp.artileList;
        return articlesList;
      }
    } on DioError catch (e) {
      logger.e(e.message);
    }
    throw Exception(
        "Somethig went wrong! StatusCode != 200. getAllSourcesBySportsEn. ");
  }

  Future<void> writeSourcesToLocalDb(List<Sources> sourcesList) async {
    localDatabase.sourcesTableDao.insertMultipleSources(sourcesList);
  }

  Future<void> writeArticlesToLocalDb(List<Articles> articleList) async {
    await localDatabase.articlesTableDao.insertMultipleArticles(articleList);
  }

  Future<List<Sources>> readAllSourcesFromLocalDb() async {
    final allSources = await localDatabase.sourcesTableDao.retrieveAllSources();

    return allSources;
  }

  Future<List<Articles>> readAllArticlesFromLocalDb(String source) async {
    final articlesList =
        await localDatabase.articlesTableDao.retrieveAllArticles(source);

    return articlesList;
  }
}