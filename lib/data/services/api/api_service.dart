import 'package:dio/dio.dart';
import 'package:news_app/data/api/api_client.dart';

import 'base_api_service.dart';

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
