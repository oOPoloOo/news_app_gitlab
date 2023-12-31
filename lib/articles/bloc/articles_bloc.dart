import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/articles/model/articles_model.dart';
import 'package:news_app/articles/use_case/articles_use_case.dart';
import 'package:news_app/common/api/api_client.dart';
import 'package:news_app/sources/model/sources_model.dart';

part 'articles_state.dart';

class ArticlesBloc extends Cubit<ArticlesState> {
  ArticlesUseCase articlesUseCase;
  List<Articles> articleList = <Articles>[];
  List<Articles> articlesFilter = [];
  late StreamSubscription localDbSubscription;
  int startFilterIndex = 2;
  Map<String, String> choiceChipsNames = {
    "todays": "todays",
    "tenDays": "10DaysOld",
    "all": "all",
  };

  ArticlesBloc({
    required this.articlesUseCase,
  }) : super(ArticlesLoading());

  // On app start loads all articles from API amd saves to local database.
  Future<void> loadArticles(List<Sources> sourceList) async {
    try {
      for (var source in sourceList) {
        await articlesUseCase.loadArticlesBySource(source.id);
      }
      emit(ArticlesLoaded(articles: articleList));
    } catch (error) {
      emit(ArticlesError());
      logger.d(error);
    }
  }

  // When local daatabase is updated retrieves it.
  void watchLocalArticles(String source) async {
    localDbSubscription = articlesUseCase.watch(source).listen((event) {
      articleList = event;
      // add(UpdateArticles(articleList));
      updateArticles(articleList);
    });
  }

  // Updates the data stored ir Articles bloc state.
  void updateArticles(List<Articles> articles) {
    emit(ArticlesLoaded(articles: articles));
  }

  // Filters and saves filtered and original data to Articles state.
  // void filterArticles(int selectedIndex) {
  void filterArticles(String selectedValue) {
    DateTime now = DateTime.now();

    DateTime nowFormatted = DateTime(now.year, now.month, now.day);
    var fomNow10Days = now.subtract(const Duration(days: 10));

    if (selectedValue == choiceChipsNames['todays']) {
      articlesFilter = articleList.where((article) {
        DateTime publishedAt = article.publishedAt;
        DateTime newPublishedAt = DateTime(
          publishedAt.year,
          publishedAt.month,
          publishedAt.day,
        );

        return newPublishedAt.isAtSameMomentAs(nowFormatted);
      }).toList();
    }

    if (selectedValue == choiceChipsNames['tenDays']) {
      articlesFilter = articleList.where((article) {
        return fomNow10Days.isBefore(article.publishedAt);
      }).toList();
    }

    if (selectedValue == choiceChipsNames['all']) {
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
    localDbSubscription.cancel();
    return await super.close();
  }
}
