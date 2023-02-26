import 'package:news_app/sources/model/sources_model.dart';

abstract class BaseSourcesUseCase {
  Future<List<Sources>> getAllSourcesByTechnologyEn();

  Future<void> writeSourcesToLocalDb(List<Sources> sourcesList);

  Future<List<Sources>> readAllSourcesFromLocalDb();
}
