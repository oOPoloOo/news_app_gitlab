import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/articles/model/articles_model.dart';
import 'package:news_app/articles/use_case/articles_use_case.dart';
import 'package:news_app/common/api/api_client.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  List<Articles> favArticleList = <Articles>[];
  ArticlesUseCase articlesUseCase;
  FavouritesBloc({required this.articlesUseCase}) : super(FavouritesLoading()) {
    on<LoadFavourites>(_onLoadFavorites);
    on<AddFavourites>(_onAddFovourite);
    on<RemoveFavourites>(_onRemoveFovourite);
    on<UpdateFavourites>(_onUpdateFavourites);
  }

  void _onAddFovourite(
      AddFavourites event, Emitter<FavouritesState> emit) async {
    event.addArticle.setIsFavourite = true;

    favArticleList.add(event.addArticle);
    updateLocalDbFavorites(favArticleList);
    favArticleList = await articlesUseCase.readAllFavArticlesFromLocalDb();
    add(UpdateFavourites(favArticleList));
  }

  void _onRemoveFovourite(
      RemoveFavourites event, Emitter<FavouritesState> emit) async {
    List<Articles> emptList = [];
    Articles removedArticle = event.removeArticle;
    removedArticle.setIsFavourite = false;
    emptList.add(removedArticle);

    updateLocalDbFavorites(emptList);
    favArticleList = await articlesUseCase.readAllFavArticlesFromLocalDb();

    add(UpdateFavourites(favArticleList));
  }

  void _onLoadFavorites(
      LoadFavourites event, Emitter<FavouritesState> emit) async {
    try {
      favArticleList = await articlesUseCase.readAllFavArticlesFromLocalDb();
    } on DioError catch (e) {
      logger.d(e);
    }
    add(UpdateFavourites(favArticleList));
  }

  void _onUpdateFavourites(
      UpdateFavourites event, Emitter<FavouritesState> emit) {
    emit(FavouritesLoaded(favArticles: event.favArticles));
  }

  void updateLocalDbFavorites(List<Articles> favArticlesList) async {
    try {
      await articlesUseCase.updateAllMultipleFavArticles(favArticlesList);
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}
