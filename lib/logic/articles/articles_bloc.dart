import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/api/api_client.dart';
import 'package:news_app/data/models/models_export.dart';
import 'package:news_app/data/repositories/news/news_repo.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  // NetworkBloc networkBloc;
  NewsRepository newsRepository;
  List<Articles> articleList = <Articles>[];
  late StreamSubscription networkStreamSubscription;

  ArticlesBloc({required this.newsRepository /*, required this.networkBloc*/})
      : super(ArticlesLoading()) {
    on<LoadArticles>(_onLoadArticles);
    on<LoadLocalArticles>(_onLoadLocalArticles);
    on<UpdateArticles>(_onUpdateArticles);
  }

  // _monitorNetworkCubit(event, Emitter<ArticlesState> emit) {
  //   logger.d("_monitorNetworkCubit ");

  //   networkStreamSubscription = networkBloc.stream.listen((state) {
  //     // neturi state jokio negauna. Praskippina logika visa

  //     if (state is NetworkSuccess) {
  //       _onLoadArticles(event, emit);
  //     }
  //     if (state is NetworkFailure) {
  //       _onLoadLocalArticles(event, emit);
  //     }
  //     logger.d("Buvo _monitorNetworkCubit");
  //   });
  // }

  void _onLoadArticles(LoadArticles event, Emitter<ArticlesState> emit) async {
    try {
      articleList = await newsRepository.getAllArticlesBySource(event.source);
    } on DioError catch (e) {
      logger.d(e);
    }
    logger.d("Buvo _onLoadArticles");
    saveDataToLocalDb(articleList);
    add(UpdateArticles(articleList));
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
