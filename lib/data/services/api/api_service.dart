import 'package:dio/dio.dart';
import 'package:news_app/data/api/api_client.dart';

//sources?from=2023-02-05&sortBy=popularity&pageSize=5&language=en
class ApiService {
  @override
  Future<Response> getSourcesByTechnologyEn(Dio dio) async {
    Response response;
    try {
      response = await dio.get("sources?language=en&category=technology");
    } on DioError catch (e) {
      logger.e(e.message);
      throw Exception(e.message);
    }
    return response;
  }
}
