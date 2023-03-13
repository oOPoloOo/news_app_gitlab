import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/article_details/article_details_screen.dart';
import 'package:news_app/article_details/helpers/article_details_responsiveness.dart';
import 'package:news_app/articles/articles_screen.dart';
import 'package:news_app/articles/helpers/article_responsiveness.dart';
import 'package:news_app/common/bloc/connectivity_check/network_bloc.dart';
import 'package:news_app/common/config/constants.dart';
import 'package:news_app/favourites/favourites_screen.dart';
import 'package:news_app/sources/bloc/sources_bloc.dart';
import 'package:news_app/sources/dependencies/source_dependencies.dart';
import 'package:news_app/sources/sources_screen.dart';
import 'package:news_app/sources/use_case/sources_use_case.dart';

// Pabandyt Navigatoriaus kita var, kur pushina o ne routina.
class AppRouter {
// Nereikia on generated !! Kaip dabar yra replacina vienas langas kita, reikia kad stakintusi ir eitu gilyn.

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case sourcesRouteName:
        return ScourcesScreen.route();
      case articlesRouteName:
        return ArticlesScreen.route();
      case articleDetailsRouteName:
        return ArticleDetailsScreen.route();
      case favouritesRouteName:
        return FavouritesScreen.route();

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






      //   return MaterialPageRoute(
      //     builder: (_) => ScourcesScreen(),
      //   );

      // case articlesRouteName:
      //   return MaterialPageRoute(
      //     builder: (_) => ArticleResponsiveness(
      //       customSizeScreen: ArticlesScreen(),
      //     ),
      //   );

      // case articleDetailsRouteName:
      //   return MaterialPageRoute(
      //     builder: (_) => const ArticleDetailsResponsiveness(
      //       largeScreen: ArticleDetailsScreen.bigSize(),
      //       smallScreen: ArticleDetailsScreen(),
      //     ),
      //   );

      // case favouritesRouteName:
      //   return MaterialPageRoute(
      //     builder: (_) => FavouritesScreen(),
      //   );