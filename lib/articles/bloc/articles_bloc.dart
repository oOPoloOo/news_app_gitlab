import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
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
  List<String> choiceChipsNames = [
    "todays",
    "10DaysOld",
    "all",
  ];

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
  void filterArticles(int selectedIndex) {
    DateTime now = DateTime.now();

    DateTime nowFormatted = DateTime(now.year, now.month, now.day);
    var fomNow10Days = now.subtract(const Duration(days: 10));

// TODO : if change names of chips or order still needs to work
    if (selectedIndex == 0) {
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
    if (selectedIndex == 1) {
      articlesFilter = articleList.where((article) {
        return fomNow10Days.isBefore(article.publishedAt);
      }).toList();
    }
    if (selectedIndex == 2) {
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
