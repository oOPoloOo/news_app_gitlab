import 'package:dio/dio.dart';

abstract class BaseApiService {
  Future<Response> getSourcesByTechnologyEn(Dio dio);
}
