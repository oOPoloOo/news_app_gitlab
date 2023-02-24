part of 'favourites_bloc.dart';

abstract class FavouritesEvent extends Equatable {
  const FavouritesEvent();

  @override
  List<Object> get props => [];
}

class LoadFavourites extends FavouritesEvent {}

class AddFavourites extends FavouritesEvent {
  final Articles addArticle;
  const AddFavourites({required this.addArticle});

  @override
  List<Object> get props => [addArticle];
}

class RemoveFavourites extends FavouritesEvent {
  final Articles removeArticle;
  const RemoveFavourites({required this.removeArticle});

  @override
  List<Object> get props => [removeArticle];
}

class UpdateFavourites extends FavouritesEvent {
  final List<Articles> favArticles;

  const UpdateFavourites(this.favArticles);

  @override
  List<Object> get props => [favArticles];
}
