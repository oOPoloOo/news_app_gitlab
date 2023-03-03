import 'package:flutter/material.dart';
import 'package:news_app/article_details/widgets/article_details_card.dart';
import 'package:news_app/articles/model/articles_model.dart';
import 'package:news_app/articles/widgets/custom_articles_card.dart';
import 'package:news_app/sources/model/sources_model.dart';
import 'package:news_app/sources/widgets/source_card.dart';

class CustomListView extends StatelessWidget {
  final List<Sources>? sources;
  final List<Articles>? articles;
  final List<Articles>? favouriteArticles;
  final Articles? articleDetails;
  final bool isSource;
  final bool isArticles;
  final bool isDetails;
  final bool isBig;

  const CustomListView.source({
    Key? key,
    required this.sources,
    this.favouriteArticles,
    this.articles,
    this.articleDetails,
    this.isSource = true,
    this.isArticles = false,
    this.isDetails = false,
    required this.isBig,
  }) : super(key: key);

  const CustomListView.articles({
    Key? key,
    this.sources,
    required this.articles,
    this.favouriteArticles,
    this.articleDetails,
    this.isSource = false,
    this.isArticles = true,
    this.isDetails = false,
    required this.isBig,
  }) : super(key: key);

  const CustomListView.details({
    Key? key,
    this.sources,
    this.articles,
    this.favouriteArticles,
    required this.articleDetails,
    this.isSource = false,
    this.isArticles = false,
    this.isDetails = true,
    required this.isBig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    if (isDetails) {
      if (isBig) {
        return ArticleDetailsCard.bigSize(
          articleInfo: articleDetails!,
          cardHeight: media.height,
          cardWidth: media.width,
          imgHeight: media.height * 0.26,
        );
      } else {
        return ArticleDetailsCard(
          articleInfo: articleDetails!,
          cardHeight: media.height,
          cardWidth: media.width * 0.95,
          imgHeight: media.height * 0.26,
        );
      }
    } else {
      return ListView(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        children: isSource
            ? sources!
                .map(
                  (source) => SourceCard(
                    sourceInfo: source,
                  ),
                )
                .toList()
            : isArticles
                ? articles!
                    .map(
                      (article) => ArticleCard(
                        articleInfo: article,
                        cardHeightAllElements: media.height * 0.55,
                        imgHeight: media.height * 0.20,
                        cardWidth: media.width * 0.95,
                      ),
                    )
                    .toList()
                : [
                    const ListTile(),
                  ],
      );
    }
  }
}
