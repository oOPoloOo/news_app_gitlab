import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/articles/model/articles_model.dart';
import 'package:news_app/articles/use_case/articles_use_case.dart';
import 'package:news_app/common/api/api_client.dart';
import 'package:news_app/sources/model/sources_model.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesUseCase articlesUseCase;
  List<Articles> articleList = <Articles>[];
  List<Articles> articlesFilter = [];
  List<String> choiceChipsNames = ["Todays", "10 days old", "All"];

  ArticlesBloc({
    required this.articlesUseCase,
  }) : super(ArticlesLoading()) {
    on<LoadArticles>(_onLoadArticles);
    on<LoadLocalArticles>(_onWatchLocalArticles);
    on<UpdateArticles>(_onUpdateArticles);
    on<FilterArticles>(_onFilterArticles);
  }

  // On app start loads all articles from API amd saves to local database.
  void _onLoadArticles(LoadArticles event, Emitter<ArticlesState> emit) async {
    try {
      for (var source in event.sourceList) {
        await articlesUseCase.loadArticlesBySource(source.id);
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }

  // When local daatabase is updated retrieves it.
  void _onWatchLocalArticles(event, Emitter<ArticlesState> emit) async {
    articlesUseCase.watch(event.source).listen((event) {
      articleList = event;
      add(UpdateArticles(articleList));
    });
  }

  // Updates the data stored ir Articles bloc state.
  void _onUpdateArticles(UpdateArticles event, Emitter<ArticlesState> emit) {
    emit(ArticlesLoaded(articles: event.articles));
  }

  // Filters and saves filtered and original data to Articles state.
  void _onFilterArticles(FilterArticles event, Emitter<ArticlesState> emit) {
    DateTime now = DateTime.now();
    DateTime nowToday = DateTime(now.year, now.month, now.day);
    var now_10d = now.subtract(const Duration(days: 10));

    if (event.selectedIndex == 0) {
      articlesFilter = articleList.where((article) {
        DateTime publishedAt = article.publishedAt;
        DateTime newPublishedAt = DateTime(
          publishedAt.year,
          publishedAt.month,
          publishedAt.day,
        );

        return newPublishedAt.isAtSameMomentAs(nowToday);
      }).toList();
    }
    if (event.selectedIndex == 1) {
      articlesFilter = articleList.where((article) {
        return now_10d.isBefore(article.publishedAt);
      }).toList();
    }
    if (event.selectedIndex == 2) {
      articlesFilter = articleList;
    }

    emit(ArticlesLoaded(
      articlesFilter: articlesFilter,
      articles: articleList,
    ));
  }

  // When app closes, close the stream subscription.
  @override
  Future<void> close() async {
    return await super.close();
  }
}
