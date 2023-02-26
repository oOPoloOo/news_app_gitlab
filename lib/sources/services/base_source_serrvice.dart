import 'package:dio/dio.dart';

abstract class BaseSourceService {
  Future<Response> getSourcesEn(Dio dio, String category);
}
