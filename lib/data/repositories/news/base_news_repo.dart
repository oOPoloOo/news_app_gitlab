import 'package:news_app/data/models/models_export.dart';

abstract class BaseNewsRepository {
  Future<List<Sources>> getAllSourcesByTechnologyEn();

  Future<List<Sources>> getAllSourcesByBusinessEn();

  Future<List<Sources>> getAllSourcesByEntertainmentEn();

  Future<List<Sources>> getAllSourcesByGeneralEn();

  Future<List<Sources>> getAllSourcesByHealthEn();

  Future<List<Sources>> getAllSourcesBySportsEn();

  Future<List<Articles>> getAllArticlesByGeneral(String domain);
}
