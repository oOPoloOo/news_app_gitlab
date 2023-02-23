import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/articles/model/articles_model.dart';
import 'package:news_app/common/repositories/news/news_repo.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  List<Articles> favArticleList = <Articles>[];
  NewsRepository newsRepository;
  FavouritesBloc({required this.newsRepository}) : super(FavouritesLoading()) {
    //on<LoadFavourites>(_onLoadArticles);
    on<AddFavourites>(_onAddFovourite);
    on<RemoveFavourites>(_onRemoveFovourite);
    on<UpdateFavourites>(_onUpdateFavourites);
  }

  void _onAddFovourite(
      AddFavourites event, Emitter<FavouritesState> emit) async {
    favArticleList.add(event.addArticle);

    // saveDataToLocalDb(articleList);
    add(UpdateFavourites(favArticleList));
  }

  void _onRemoveFovourite(
      RemoveFavourites event, Emitter<FavouritesState> emit) async {
    favArticleList.remove(event.removeArticle);

    // saveDataToLocalDb(articleList);
    add(UpdateFavourites(favArticleList));
  }

  // void _onLoadLocalArticles(
  //     LoadLocalArticles event, Emitter<ArticlesState> emit) async {
  //   try {
  //     articleList =
  //         await newsRepository.readAllArticlesFromLocalDb(event.source);
  //   } on DioError catch (e) {
  //     logger.d(e);
  //   }
  //   add(UpdateArticles(articleList));
  // }

  void _onUpdateFavourites(
      UpdateFavourites event, Emitter<FavouritesState> emit) {
    emit(FavouritesLoaded(favArticles: event.favArticles));
  }

  // void saveDataToLocalDb(List<Articles> articlesList) async {
  //   await newsRepository.writeArticlesToLocalDb(articlesList);
  // }
}
