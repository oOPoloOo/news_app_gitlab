part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class InSources extends NavigationState {}

class InFavourites extends NavigationState {}

class InArticles extends NavigationState {}

class InArticleDetails extends NavigationState {}
