part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class GoToSources extends NavigationEvent {
  final NavigationState state;
  final BuildContext context;

  const GoToSources({
    required this.state,
    required this.context,
  });
}

class GoToFavourites extends NavigationEvent {
  final NavigationState state;
  final BuildContext context;
  final int? inheritedIndex;

  const GoToFavourites({
    required this.state,
    required this.context,
    this.inheritedIndex,
  });
}

class GoToArticles extends NavigationEvent {
  final NavigationState state;
  final BuildContext context;

  const GoToArticles({
    required this.state,
    required this.context,
  });
}

class GoToArticleDetails extends NavigationEvent {
  final NavigationState state;
  final BuildContext context;

  const GoToArticleDetails({
    required this.state,
    required this.context,
  });
}

class PopThePage extends NavigationEvent {
  final NavigationState state;
  final BuildContext context;

  const PopThePage({
    required this.state,
    required this.context,
  });
}
