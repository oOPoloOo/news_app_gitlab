import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/config/constants.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(InSources()) {
    on<GoToSources>(_onGoToSources);
    on<GoToFavourites>(_onGoToFavourites);
    on<GoToArticles>(_onGoToArticles);
    on<GoToArticleDetails>(_onGoToArticleDetails);
    on<PopThePage>(_onPopThePage);
  }

  void _onPopThePage(PopThePage event, Emitter<NavigationState> emit) {
    if (event.state is InArticleDetails) {
      Navigator.pop(event.context);
      emit(InArticles());
    }
    if (event.state is InArticles) {
      Navigator.pop(event.context);
      emit(InSources());
    }
  }

  void _onGoToSources(GoToSources event, Emitter<NavigationState> emit) {
    if (event.state is InSources) {
    } else {
      Navigator.pushNamed(event.context, sourcesRouteName);
      emit(InSources());
    }
  }

  void _onGoToFavourites(GoToFavourites event, Emitter<NavigationState> emit) {
    if (event.state is InFavourites) {
    } else {
      Navigator.pushNamed(event.context, favouritesRouteName,
          arguments: event.inheritedIndex);
      emit(InFavourites());
    }
  }

  void _onGoToArticles(GoToArticles event, Emitter<NavigationState> emit) {
    if (event.state is InArticles) {
    } else {
      Navigator.pushNamed(event.context, articlesRouteName);

      emit(InArticles());
    }
  }

  void _onGoToArticleDetails(
      GoToArticleDetails event, Emitter<NavigationState> emit) {
    if (event.state is InArticleDetails) {
    } else {
      Navigator.pushNamed(event.context, articleDetailsRouteName);
      emit(InArticleDetails());
    }
  }
}
