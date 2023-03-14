import 'package:news_app/common/database/local_database.dart';
import 'package:news_app/common/services/api_config/api_const.dart';
import 'package:news_app/sources/model/sources_model.dart';
import 'package:news_app/sources/services/sources_service.dart';
import 'package:news_app/sources/use_case/base_sources_use_case.dart';

class SourcesUseCase extends BaseSourcesUseCase {
  SourcesService sourcesService = SourcesService();
  LocalDatabase localDatabase = LocalDatabase();

  @override
  Future<void> loadSources() async {
    List<Sources> sourceList;

    sourceList = await sourcesService.getSourcesEn(sourcesTechnologyEn);

    await localDatabase.sourcesTableDao.insertMultipleSources(sourceList);
  }

  @override
  Stream<List<Sources>> watch() {
    return localDatabase.sourcesTableDao.watchSources();
  }
}
