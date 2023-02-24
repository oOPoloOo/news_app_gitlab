import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/articles/model/articles_model.dart';
import 'package:news_app/common/api/api_client.dart';
import 'package:news_app/common/repositories/news/news_repo.dart';
import 'package:news_app/sources/model/sources_model.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  NewsRepository newsRepository;
  List<Articles> articleList = <Articles>[];
  late StreamSubscription networkStreamSubscription;

  ArticlesBloc({required this.newsRepository}) : super(ArticlesLoading()) {
    on<LoadArticles>(_onLoadArticles);
    on<LoadLocalArticles>(_onLoadLocalArticles);
    on<UpdateArticles>(_onUpdateArticles);
  }

  void _onLoadArticles(LoadArticles event, Emitter<ArticlesState> emit) async {
    try {
      for (var source in event.sourceList) {
        articleList = await newsRepository.getAllArticlesBySource(source.id);
        saveDataToLocalDb(articleList);
        logger.d('Source: ${source.id}');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }

  void _onLoadLocalArticles(
      LoadLocalArticles event, Emitter<ArticlesState> emit) async {
    try {
      articleList =
          await newsRepository.readAllArticlesFromLocalDb(event.source);
    } on DioError catch (e) {
      logger.d(e);
    }
    add(UpdateArticles(articleList));
  }

  void _onUpdateArticles(UpdateArticles event, Emitter<ArticlesState> emit) {
    emit(ArticlesLoaded(articles: event.articles));
  }

  void saveDataToLocalDb(List<Articles> articlesList) async {
    await newsRepository.writeArticlesToLocalDb(articlesList);
  }

  @override
  Future<void> close() async {
    networkStreamSubscription.cancel();
    return await super.close();
  }
}
