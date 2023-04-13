part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class InSplash extends NavigationState {}

class SplashToSources extends NavigationState {}

class InFavouritesOrSources extends NavigationState {}

class InArticles extends NavigationState {}

class InArticleDetails extends NavigationState {}
