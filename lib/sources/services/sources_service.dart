import 'package:dio/dio.dart';
import 'package:news_app/common/api/api_client.dart';
import 'package:news_app/sources/services/base_source_serrvice.dart';

class SourcesService extends BaseSourceService {
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
}
