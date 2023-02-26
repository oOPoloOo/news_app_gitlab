import 'package:news_app/articles/model/articles_model.dart';

abstract class BaseArticlesUseCase {
  Future<List<Articles>> getAllArticlesBySource(String source);

  Future<void> writeArticlesToLocalDb(List<Articles> articleList);

  Future<List<Articles>> readAllArticlesFromLocalDb(String source);

  Future<List<Articles>> readAllFavArticlesFromLocalDb();

  Future<void> updateAllMultipleFavArticles(List<Articles> favArticleList);
}
