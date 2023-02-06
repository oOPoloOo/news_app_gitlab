import 'package:flutter/material.dart';
import 'package:news_app/view/config/constants.dart';
import '../../data/models/models_export.dart';

class ArticleCard extends StatelessWidget {
  final Articles articleInfo;
  final double cardWidth;
  final double cardHeightAllElements;
  final double cardHeightNoImg;
  final double cardHeightOnlyDateTitle;
  final double imgHeight;

  const ArticleCard({
    required this.articleInfo,
    required this.cardWidth,
    required this.cardHeightAllElements,
    required this.cardHeightNoImg,
    required this.cardHeightOnlyDateTitle,
    required this.imgHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              articleDetailsRouteName, /*arguments: source*/
            );
          },
          child: SizedBox(
            width: cardWidth,
            height: articleInfo.urlToImage.isNotEmpty
                ? cardHeightAllElements
                : articleInfo.description.isNotEmpty
                    ? cardHeightNoImg
                    : cardHeightOnlyDateTitle,
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Column(
                children: [
                  articleInfo.urlToImage.isNotEmpty
                      ? _buildImage(
                          cardWidth: cardWidth,
                          imgHeight: imgHeight,
                          articleInfo: articleInfo,
                        )
                      : const SizedBox(height: 0, width: 0),
                  _buildDateText(articleInfo: articleInfo),
                  _buildTitleText(articleInfo: articleInfo),
                  articleInfo.description.isNotEmpty
                      ? _buildDescription(articleInfo: articleInfo)
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _buildDescription extends StatelessWidget {
  const _buildDescription({
    super.key,
    required this.articleInfo,
  });

  final Articles articleInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 10.0,
      ),
      child: Text(
        articleInfo.description,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

class _buildTitleText extends StatelessWidget {
  const _buildTitleText({
    super.key,
    required this.articleInfo,
  });

  final Articles articleInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5.0,
        right: 5.0,
        top: 8,
      ),
      child: Text(
        articleInfo.title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}

class _buildDateText extends StatelessWidget {
  const _buildDateText({
    super.key,
    required this.articleInfo,
  });

  final Articles articleInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 7.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
            width: 10,
            child: Container(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "${articleInfo.publishedAt}",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class _buildImage extends StatelessWidget {
  const _buildImage({
    super.key,
    required this.articleInfo,
    required this.cardWidth,
    required this.imgHeight,
  });

  final Articles articleInfo;
  final double cardWidth;
  final double imgHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      height: imgHeight,
      child: Image.network(
        articleInfo.urlToImage,
        fit: BoxFit.fill,
      ),
    );
  }
}
