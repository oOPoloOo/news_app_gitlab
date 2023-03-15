// ignore_for_file: must_be_immutable

part of 'favourites_bloc.dart';

abstract class FavouritesState extends Equatable {
  const FavouritesState();

  @override
  List<Object> get props => [];
}

class FavouritesLoading extends FavouritesState {}

class FavouritesLoaded extends FavouritesState {
  List<Articles> favArticles;

  FavouritesLoaded({required this.favArticles});

  @override
  List<Object> get props => [favArticles];
}
