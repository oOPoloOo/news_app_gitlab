import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/api/api_client.dart';
import 'package:news_app/data/models/models_export.dart';
import 'package:news_app/data/repositories/news/news_repo.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  NewsRepository newsRepository;

  List<Articles> articleList = <Articles>[];
  ArticlesBloc({required this.newsRepository}) : super(ArticlesLoading()) {
    on<LoadArticles>(_onLoadArticles);
    on<UpdateArticles>(_onUpdateArticles);
  }

  void _onLoadArticles(LoadArticles event, Emitter<ArticlesState> emit) async {
    try {
      articleList = await newsRepository.getAllArticlesBySource(event.source);
    } on DioError catch (e) {
      logger.d(e);
    }
    add(UpdateArticles(articleList));
  }

  void _onUpdateArticles(UpdateArticles event, Emitter<ArticlesState> emit) {
    emit(ArticlesLoaded(articles: event.articles));
  }
}
