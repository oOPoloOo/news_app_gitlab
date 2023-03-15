import 'package:flutter/material.dart';
import 'package:news_app/article_details/article_details_screen.dart';
import 'package:news_app/articles/articles_screen.dart';
import 'package:news_app/common/config/constants.dart';
import 'package:news_app/favourites/favourites_screen.dart';
import 'package:news_app/sources/sources_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case sourcesRouteName:
        return ScourcesScreen.route();
      case articlesRouteName:
        return ArticlesScreen.route();
      case articleDetailsRouteName:
        return ArticleDetailsScreen.route();
      case favouritesRouteName:
        return FavouritesScreen.route(
            inheritedIndex: settings.arguments as int);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
