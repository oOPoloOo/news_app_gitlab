import 'package:dio/dio.dart';
import 'package:news_app/data/api/api_client.dart';
import 'package:news_app/data/models/models_export.dart';
import 'package:news_app/data/services/api/api_service.dart';

import 'base_news_repo.dart';

class NewsRepository extends BaseNewsRepository {
  late Dio apiClient;
  ApiService apiService = ApiService();

  NewsRepository() {
    apiClient = newsClient();
  }

  @override
  Future<List<Sources>> getAllSourcesByTechnologyEn() async {
    //String todaysDate = DateFormat('yyy-MM-dd').format(DateTime.now());
    Response response;
    List<Sources> sourceList;
    SourcesResponse sourcesResp;

    try {
      response = await apiService.getSourcesByTechnologyEn(apiClient);
      if (response.statusCode == 200) {
        sourcesResp = SourcesResponse.fromJson(response.data);
        sourceList = sourcesResp.sourceList;
        return sourceList;
      }
    } on DioError catch (e) {
      logger.e(e.message);
    }
    throw Exception("Somethig went wrong! StatusCode != 200 ");
  }
}
