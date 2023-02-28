import 'package:news_app/sources/model/sources_model.dart';

abstract class BaseSourcesUseCase {
  Future<void> loadSources();

  Future<void> writeSourcesToLocalDb(List<Sources> sourcesList);

  Stream<List<Sources>> watch();
}
