import 'package:news_app/articles/model/articles_model.dart';

abstract class BaseArticlesUseCase {
  Future<void> loadArticlesBySource(String source);

  Future<void> writeArticlesToLocalDb(List<Articles> articleList);

  Stream<List<Articles>> watch(String source);

  Future<List<Articles>> readAllFavArticlesFromLocalDb();

  Future<void> updateAllMultipleFavArticles(List<Articles> favArticleList);
}
