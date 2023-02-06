import 'package:flutter/material.dart';
import 'package:news_app/data/models/models_export.dart';
import 'package:news_app/view/config/constants.dart';
import '../screens/screens_export.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case sourcesRouteName:
        return ScourcesScreen.route();
      case articlesRouteName:
        return ArticlesScreen.route();
      case articleDetailsRouteName:
        return ArticleDetailsScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
      ),
    );
  }
}
