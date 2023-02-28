import 'package:dio/dio.dart';
import 'package:news_app/common/api/api_client.dart';
import 'package:news_app/common/database/local_database.dart';
import 'package:news_app/common/services/api_config/api_const.dart';
import 'package:news_app/sources/model/sources_model.dart';
import 'package:news_app/sources/model/sources_response_model.dart';
import 'package:news_app/sources/services/sources_service.dart';
import 'package:news_app/sources/use_case/base_sources_use_case.dart';

class SourcesUseCase extends BaseSourcesUseCase {
  late Dio apiClient;
  SourcesService sourcesService = SourcesService();
  LocalDatabase localDatabase = LocalDatabase();

  SourcesUseCase() {
    apiClient = newsClient();
  }

  @override
  Future<void> loadSources() async {
    Response response;
    List<Sources> sourceList;
    SourcesResponse sourcesResp;

    try {
      response =
          await sourcesService.getSourcesEn(apiClient, sourcesTechnologyEn);
      if (response.statusCode == 200) {
        sourcesResp = SourcesResponse.fromJson(response.data);
        sourceList = sourcesResp.sourceList;
        await localDatabase.sourcesTableDao.insertMultipleSources(sourceList);
      }
    } on DioError catch (e) {
      logger.e(e.message);
    }
    throw Exception(
        "Somethig went wrong! StatusCode != 200. getAllSourcesByTechnologyEn.");
  }

  @override
  Stream<List<Sources>> watch() {
    return localDatabase.sourcesTableDao.watchSources();
  }

  @override
  Future<void> writeSourcesToLocalDb(List<Sources> sourcesList) async {
    localDatabase.sourcesTableDao.insertMultipleSources(sourcesList);
  }
}
