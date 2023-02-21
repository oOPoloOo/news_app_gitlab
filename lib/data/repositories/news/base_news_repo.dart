import 'package:news_app/data/models/models_export.dart';

abstract class BaseNewsRepository {
  Future<List<Sources>> getAllSourcesByTechnologyEn();

  Future<List<Articles>> getAllArticlesBySource(String source);
}