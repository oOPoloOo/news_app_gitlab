import 'package:news_app/articles/model/articles_model.dart';

abstract class BaseArticlesUseCase {
  // Loads all articles by source from API.
  Future<void> loadArticlesBySource(String source);

  // Stream subscription to local database.
  Stream<List<Articles>> watch(String source);

  //Retrieves only favoutite articles from local db.
  Future<List<Articles>> readAllFavArticlesFromLocalDb();

  //Updatees local db with favourite articles list.
  Future<void> updateAllMultipleFavArticles(List<Articles> favArticleList);
}
