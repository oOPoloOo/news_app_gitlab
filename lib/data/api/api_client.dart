import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

var logger = Logger();

Dio newsClient() {
  Dio dio = Dio();

  String apiKey = "a43c6cd50b834d7a9d69ac61cc294779";

  dio.options.baseUrl = "https://newsapi.org/v2/";
  dio.options.queryParameters = {'apiKey': apiKey};

  dio.options.connectTimeout = 5000;

  return dio;
}
