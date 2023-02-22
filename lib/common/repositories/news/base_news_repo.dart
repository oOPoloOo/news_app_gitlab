import 'package:news_app/articles/model/articles_model.dart';
import 'package:news_app/sources/model/sources_model.dart';

abstract class BaseNewsRepository {
  Future<List<Sources>> getAllSourcesByTechnologyEn();

  Future<List<Articles>> getAllArticlesBySource(String source);
}
