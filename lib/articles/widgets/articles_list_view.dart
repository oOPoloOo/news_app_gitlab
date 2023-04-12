import 'package:flutter/material.dart';
import 'package:news_app/articles/model/articles_model.dart';
import 'package:news_app/articles/widgets/custom_articles_card.dart';

class ArticlesListView extends StatelessWidget {
  final List<Articles> articles;

  const ArticlesListView({
    Key? key,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return ListView(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        children: articles
            .map(
              (article) => ArticleCard(
                articleInfo: article,
                imgHeight: media.height * 0.20,
              ),
            )
            .toList());
  }
}
