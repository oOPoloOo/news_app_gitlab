import 'package:dio/dio.dart';
import 'package:news_app/articles/services/base_articles_service.dart';
import 'package:news_app/common/api/api_client.dart';

class ArticleService extends BaseArticlesService {
  @override
  Future<Response> getArticles(Dio dio, String articleHeader) async {
    Response response;
    try {
      response = await dio.get(articleHeader);
    } on DioError catch (e) {
      logger.e(e.message);
      throw Exception(e.message);
    }
    return response;
  }
}
