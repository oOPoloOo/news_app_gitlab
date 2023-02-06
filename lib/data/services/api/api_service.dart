import 'package:dio/dio.dart';
import 'package:news_app/data/api/api_client.dart';

import 'base_api_service.dart';

//sources?from=2023-02-05&sortBy=popularity&pageSize=5&language=en
class ApiService extends BaseApiService {
  @override
  Future<Response> getSourcesEn(Dio dio, String category) async {
    Response response;
    try {
      response = await dio.get(category);
    } on DioError catch (e) {
      logger.e(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getArticles(Dio dio, String articleData) async {
    Response response;
    try {
      response = await dio.get(articleData);
    } on DioError catch (e) {
      logger.e(e.message);
      throw Exception(e.message);
    }
    return response;
  }
}
