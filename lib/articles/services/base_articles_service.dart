import 'package:news_app/articles/model/articles_model.dart';

abstract class BaseArticlesService {
  Future<List<Articles>> getArticles(String articleHeader);
}
