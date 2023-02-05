import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:news_app/data/models/models_export.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsCard extends StatelessWidget {
  final ArticleDetails articleInfo;

  final double cardHeight;

  final double cardWidth;

  final double imgHeight;
  const ArticleDetailsCard({
    required this.articleInfo,
    required this.cardHeight,
    required this.cardWidth,
    required this.imgHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: cardHeight,
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Column(
                children: [
                  _buildImage(
                    articleInfo: articleInfo,
                    imageWidth: cardWidth,
                    imgHeight: imgHeight,
                  ),
                  _buildDate(flex: 1, articleInfo: articleInfo),
                  _buildTitle(flex: 2, articleInfo: articleInfo),
                  _buildContent(flex: 6, articleInfo: articleInfo),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 5.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "Link to original article:",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          Linkify(
                            onOpen: _onOpen,
                            textScaleFactor: 1,
                            text: articleInfo.articleUrl,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }
}

class _buildImage extends StatelessWidget {
  const _buildImage({
    super.key,
    required this.articleInfo,
    required this.imageWidth,
    required this.imgHeight,
  });

  final ArticleDetails articleInfo;
  final double imageWidth;
  final double imgHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: articleInfo.imgUrl.isNotEmpty
          ? SizedBox(
              width: imageWidth,
              height: imgHeight,
              child: Image.network(
                articleInfo.imgUrl,
                fit: BoxFit.cover,
              ),
            )
          : const SizedBox(
              height: 0,
              width: 0,
            ),
    );
  }
}

class _buildContent extends StatelessWidget {
  const _buildContent({
    super.key,
    required this.flex,
    required this.articleInfo,
  });

  final int flex;
  final ArticleDetails articleInfo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 10.0,
        ),
        child: Text(
          articleInfo.content,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class _buildTitle extends StatelessWidget {
  const _buildTitle({
    super.key,
    required this.flex,
    required this.articleInfo,
  });

  final int flex;
  final ArticleDetails articleInfo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          top: 20.0,
          right: 8.0,
          bottom: 5.0,
        ),
        child: Text(
          articleInfo.title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}

class _buildDate extends StatelessWidget {
  const _buildDate({
    super.key,
    required this.flex,
    required this.articleInfo,
  });

  final int flex;
  final ArticleDetails articleInfo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const VerticalDivider(
              color: Colors.black,
              thickness: 4,
            ),
            Text(
              '${articleInfo.date}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
