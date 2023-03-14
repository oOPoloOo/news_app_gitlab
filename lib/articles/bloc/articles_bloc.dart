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

  // ArticlesScreen variables
  List<String> choiceChipsNames = ["Todays", "10 days old", "All"];
  // DateTime now = DateTime.now();
  // DateTime nowToday = DateTime(now.year, now.month, now.day);
  // var now_10d = now.subtract(const Duration(days: 10));
//  final DateTime now;

//   DateTime nowToday;
//   DateTime now_10d;

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

  // Saves filtered and original data to Articles state.
  void _onFilterArticles(FilterArticles event, Emitter<ArticlesState> emit) {
    emit(ArticlesLoaded(
      articlesFilter: event.filteredAarticles,
      articles: event.originalArticles,
    ));
  }

  // When app closes, close the stream subscription.
  @override
  Future<void> close() async {
    return await super.close();
  }
}
