import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/articles/bloc/articles_bloc.dart';
import 'package:news_app/common/config/constants.dart';

part 'navigation_state.dart';

class NavigationBloc extends Cubit<NavigationState> {
  ArticlesBloc articlesBloc;
  late StreamSubscription articlesBlocStreamSubscription;

  NavigationBloc({required this.articlesBloc}) : super(InSplash());

  void popThePage(BuildContext context, NavigationState state) {
    if (state is InArticleDetails) {
      Navigator.pop(context);
      emit(InArticles());
    }
    if (state is InArticles) {
      Navigator.pop(context);
      emit(InSources());
    }
  }

// TODO : if state do not needed in other  events use same method
//for _onGoFromSplash and _onGoToSources

  //Unlike GoToSources event do not require state
  void goFromSplash(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, homeRouteName);
      emit(InSources());
    });
  }

  void goToSources(BuildContext context, NavigationState state) {
    if (state is InSources) {
    } else {
      Navigator.pushNamed(context, sourcesRouteName);
      emit(InSources());
    }
  }

  void goToFavourites(
      BuildContext context, NavigationState state, int? inheritedIndex) {
    if (state is InFavourites) {
    } else {
      Navigator.pushNamed(context, favouritesRouteName,
          arguments: inheritedIndex);
      emit(InFavourites());
    }
  }

  void goToArticles(BuildContext context, NavigationState state) {
    if (state is InArticles) {
    } else {
      Navigator.pushNamed(context, articlesRouteName);

      emit(InArticles());
    }
  }

  void goToArticleDetails(BuildContext context, NavigationState state) {
    if (state is InArticleDetails) {
    } else {
      Navigator.pushNamed(context, articleDetailsRouteName);
      emit(InArticleDetails());
    }
  }

  @override
  Future<void> close() async {
    articlesBlocStreamSubscription.cancel();
    return await super.close();
  }
}
