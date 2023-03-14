import 'package:dio/dio.dart';
import 'package:news_app/articles/model/articles_model.dart';
import 'package:news_app/articles/model/articles_response_model.dart';
import 'package:news_app/articles/services/base_articles_service.dart';
import 'package:news_app/common/api/api_client.dart';

class ArticleService extends BaseArticlesService {
  late Dio apiClient;

  ArticleService() {
    apiClient = newsClient();
  }

  @override
  Future<List<Articles>> getArticles(String articleHeader) async {
    Response response;
    List<Articles> articlesList;
    ArticlesResponse articlesResp;
    try {
      response = await apiClient.get(articleHeader);
      articlesResp = ArticlesResponse.fromJson(response.data);
      articlesList = articlesResp.artileList;

      return articlesList;
    } catch (error) {
      logger.e(error);
      throw Exception(error);
    }
  }
}
