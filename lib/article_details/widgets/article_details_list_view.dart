import 'package:flutter/material.dart';
import 'package:news_app/article_details/widgets/article_details_card.dart';
import 'package:news_app/articles/model/articles_model.dart';

class ArticleDetailsView extends StatelessWidget {
  final Articles? articleDetails;
  final bool isBig;

  const ArticleDetailsView({
    Key? key,
    required this.articleDetails,
    required this.isBig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    if (isBig) {
      return ArticleDetailsCard.bigSize(
        articleInfo: articleDetails!,
        imgHeight: media.height * 0.26,
      );
    } else {
      return ArticleDetailsCard(
        articleInfo: articleDetails!,
        imgHeight: media.height * 0.26,
      );
    }
  }
}
