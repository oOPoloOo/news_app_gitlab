import 'package:flutter/material.dart';
import 'package:news_app/view/config/constants.dart';
import 'package:news_app/view/widgets/custom_list_view.dart';
import 'package:news_app/view/widgets/widgets_export.dart';

import '../../../data/models/models_export.dart';

class ArticlesScreen extends StatelessWidget {
  static const String routeName = articlesRouteName;

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ArticlesScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        screen: routeName,
        title: "Articles Screen",
      ),
      body: _buildBody(
        backColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}

class _buildBody extends StatelessWidget {
  const _buildBody({
    Key? key,
    required this.backColor,
  }) : super(key: key);

  final Color? backColor;

  @override
  Widget build(BuildContext context) {
    List<Articles> articles = Articles.articlesMap;
    return Container(
      color: backColor,
      child: CustomListView.articles(articles: articles),
    );
  }
}
