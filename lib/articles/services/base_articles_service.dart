import 'package:dio/dio.dart';

abstract class BaseArticlesService {
  Future<Response> getArticles(Dio dio, String articleHeader);
}
