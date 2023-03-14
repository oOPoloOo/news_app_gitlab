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

  // Add favourite article to local db,
  //then retrieves it and updates Articles state.
  void _onAddFovourite(
      AddFavourites event, Emitter<FavouritesState> emit) async {
    event.addArticle.setIsFavourite = true;

    favArticleList.add(event.addArticle);
    updateLocalDbFavorites(favArticleList);
    favArticleList = await articlesUseCase.readAllFavArticlesFromLocalDb();
    add(UpdateFavourites(favArticleList));
  }

  // Remove favourite article from local db,
  //then retrieves it and updates Articles state.
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

  //Loads only favourite articles.
  void _onLoadFavorites(
      LoadFavourites event, Emitter<FavouritesState> emit) async {
    try {
      favArticleList = await articlesUseCase.readAllFavArticlesFromLocalDb();
    } catch (error) {
      logger.d(error);
    }
    add(UpdateFavourites(favArticleList));
  }

  //Update Favourites bloc state with list.
  void _onUpdateFavourites(
      UpdateFavourites event, Emitter<FavouritesState> emit) {
    emit(FavouritesLoaded(favArticles: event.favArticles));
  }

  //Update database with favourite article list, for Favourites_screen.
  void updateLocalDbFavorites(List<Articles> favArticlesList) async {
    try {
      await articlesUseCase.updateAllMultipleFavArticles(favArticlesList);
    } catch (error) {
      logger.d(error);
    }
  }
}
