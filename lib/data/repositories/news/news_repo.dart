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
  Future<List<Sources>> getAllSourcesByBusinessEn() async {
    Response response;
    List<Sources> sourceList;
    SourcesResponse sourcesResp;
    try {
      response = await apiService.getSourcesEn(apiClient, sourcesBusinessEn);
      if (response.statusCode == 200) {
        sourcesResp = SourcesResponse.fromJson(response.data);
        sourceList = sourcesResp.sourceList;
        return sourceList;
      }
    } on DioError catch (e) {
      logger.e(e.message);
    }
    throw Exception(
        "Somethig went wrong! StatusCode != 200. getAllSourcesByBusinessEn. ");
  }

  @override
  Future<List<Sources>> getAllSourcesByEntertainmentEn() async {
    Response response;
    List<Sources> sourceList;
    SourcesResponse sourcesResp;
    try {
      response =
          await apiService.getSourcesEn(apiClient, sourcesEntertainmentEn);
      if (response.statusCode == 200) {
        sourcesResp = SourcesResponse.fromJson(response.data);
        sourceList = sourcesResp.sourceList;
        return sourceList;
      }
    } on DioError catch (e) {
      logger.e(e.message);
    }
    throw Exception(
        "Somethig went wrong! StatusCode != 200. getAllSourcesByEntertainmentEn. ");
  }

  @override
  Future<List<Sources>> getAllSourcesByGeneralEn() async {
    Response response;
    List<Sources> sourceList;
    SourcesResponse sourcesResp;
    try {
      response = await apiService.getSourcesEn(apiClient, sourcesGeneralEn);
      if (response.statusCode == 200) {
        sourcesResp = SourcesResponse.fromJson(response.data);
        sourceList = sourcesResp.sourceList;
        return sourceList;
      }
    } on DioError catch (e) {
      logger.e(e.message);
    }
    throw Exception(
        "Somethig went wrong! StatusCode != 200. getAllSourcesByGeneralEn. ");
  }

  @override
  Future<List<Sources>> getAllSourcesByHealthEn() async {
    Response response;
    List<Sources> sourceList;
    SourcesResponse sourcesResp;
    try {
      response = await apiService.getSourcesEn(apiClient, sourcesHealthEn);
      if (response.statusCode == 200) {
        sourcesResp = SourcesResponse.fromJson(response.data);
        sourceList = sourcesResp.sourceList;
        return sourceList;
      }
    } on DioError catch (e) {
      logger.e(e.message);
    }
    throw Exception(
        "Somethig went wrong! StatusCode != 200. getAllSourcesByHealthEn ");
  }

  @override
  Future<List<Sources>> getAllSourcesBySportsEn() async {
    Response response;
    List<Sources> sourceList;
    SourcesResponse sourcesResp;
    try {
      response = await apiService.getSourcesEn(apiClient, sourcesSportsEn);
      if (response.statusCode == 200) {
        sourcesResp = SourcesResponse.fromJson(response.data);
        sourceList = sourcesResp.sourceList;
        return sourceList;
      }
    } on DioError catch (e) {
      logger.e(e.message);
    }
    throw Exception(
        "Somethig went wrong! StatusCode != 200. getAllSourcesBySportsEn. ");
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
    //Paimu metoda is DAo
    localDatabase.sourcesTableDao.insertMultipleEntries(sourcesList);

    // TEST Tvarkoj
    final allSources =
        await localDatabase.select(localDatabase.sourcesTable).get();
    logger.d(allSources);
    // print('Sources in database: $allSources');
  }

  Future<void> writeArticlesToLocalDb(List<Articles> articleList) async {
    //Paimu metoda is DAo
    localDatabase.articlesTableDao.insertMultipleEntries(articleList);

    //TEST Tvarkoj
    // final allSources =
    //     await localDatabase.select(localDatabase.sourcesTable).get();
    // logger.d(allSources);
    // print('Sources in database: $allSources');
  }
}
