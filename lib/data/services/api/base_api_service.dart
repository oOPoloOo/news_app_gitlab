import 'package:dio/dio.dart';

abstract class BaseApiService {
  Future<Response> getSourcesEn(Dio dio, String category);

  Future<Response> getArticles(Dio dio, String category);
}
