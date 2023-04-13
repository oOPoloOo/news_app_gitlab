import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

var logger = Logger();

Dio newsClient() {
  Dio dio = Dio();

  String apiKey = "8e9de83c1c9a499da06c99136f492865";

  dio.options.baseUrl = "https://newsapi.org/v2/";
  dio.options.queryParameters = {'apiKey': apiKey};

  dio.options.connectTimeout = 5000;

  return dio;
}
