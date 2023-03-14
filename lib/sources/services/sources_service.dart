import 'package:dio/dio.dart';
import 'package:news_app/common/api/api_client.dart';
import 'package:news_app/sources/model/sources_model.dart';
import 'package:news_app/sources/model/sources_response_model.dart';
import 'package:news_app/sources/services/base_source_serrvice.dart';

class SourcesService extends BaseSourceService {
  late Dio apiClient;

  SourcesService() {
    apiClient = newsClient();
  }

  @override
  Future<List<Sources>> getSourcesEn(String category) async {
    Response response;
    List<Sources> sourceList;
    SourcesResponse sourcesResp;

    try {
      response = await apiClient.get(category);

      sourcesResp = SourcesResponse.fromJson(response.data);
      sourceList = sourcesResp.sourceList;
      return sourceList;
    } catch (error) {
      logger.e(error);
      throw Exception(error);
    }
  }
}
