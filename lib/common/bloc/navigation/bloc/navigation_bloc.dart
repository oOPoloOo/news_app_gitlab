import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/article_details/article_details_screen.dart';
import 'package:news_app/article_details/helpers/article_details_responsiveness.dart';
import 'package:news_app/articles/articles_screen.dart';
import 'package:news_app/articles/bloc/articles_bloc.dart';
import 'package:news_app/home/home_page.dart';

part 'navigation_state.dart';

class NavigationBloc extends Cubit<NavigationState> {
  ArticlesBloc articlesBloc;
  late StreamSubscription articlesBlocStreamSubscription;

  NavigationBloc({required this.articlesBloc}) : super(InSplash());

  void popThePage(BuildContext context, NavigationState state) {
    if (state is InArticleDetails) {
      emit(InArticles());
    }
    if (state is InArticles) {
      emit(InFavouritesOrSources());
    }
  }

  void goFromSplash(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (Route<dynamic> route) => false);
    });
  }

  void goToArticles(BuildContext context, NavigationState state) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ArticlesScreen(),
      ),
    );
  }

  void goToArticleDetails(BuildContext context, NavigationState state) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ArticleDetailsResponsiveness(
          largeScreen: ArticleDetailsScreen.bigSize(),
          smallScreen: ArticleDetailsScreen(),
        ),
      ),
    );
  }

  @override
  Future<void> close() async {
    articlesBlocStreamSubscription.cancel();
    return await super.close();
  }
}
