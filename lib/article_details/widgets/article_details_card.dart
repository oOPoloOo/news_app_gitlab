// ignore_for_file: use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:intl/intl.dart';
import 'package:news_app/articles/model/articles_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ArticleDetailsCard extends StatelessWidget {
  final Articles articleInfo;

  final double imgHeight;

  final double cardMargin;
  final double cardBorderRadius;

  const ArticleDetailsCard({
    required this.articleInfo,
    required this.imgHeight,
    this.cardBorderRadius = 40,
    this.cardMargin = 10,
  });

  const ArticleDetailsCard.bigSize({
    required this.articleInfo,
    required this.imgHeight,
    this.cardBorderRadius = 0,
    this.cardMargin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Card(
          elevation: 5,
          margin: EdgeInsets.all(cardMargin),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardBorderRadius),
          ),
          child: Column(
            children: [
              _buildImage(
                context,
                articleInfo.imageUrl,
                imgHeight,
              ),
              Divider(
                thickness: 30,
                color: Theme.of(context).colorScheme.primary,
                height: 30,
              ),
              _buildDate(context, articleInfo),
              _buildTitle(context, articleInfo),
              _buildContent(context, articleInfo),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 8.0,
                  top: 6.0,
                  bottom: 6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "${"linkToOriginalArticle".tr()}: ",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Linkify(
                      onOpen: _onOpen,
                      textScaleFactor: 1,
                      text: articleInfo.articleUrl,
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(
    BuildContext context,
    String? imageUrl,
    double iHeight,
  ) {
    return SizedBox(
      width: double.infinity,
      height: iHeight,
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: imageUrl ?? '',
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => Image.asset(
          'assets/no_nwtwork_egg.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, Articles articleInf) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 10.0,
        top: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            articleInf.content,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context, Articles articleInf) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        top: 20.0,
        right: 8.0,
        bottom: 5.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            articleInf.title,
            maxLines: 3,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }

  Widget _buildDate(BuildContext context, Articles articleInf) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            VerticalDivider(
              color: Theme.of(context).colorScheme.background,
              thickness: 4,
            ),
            Text(
              DateFormat('yyyy-MM-dd hh:mm').format(articleInf.publishedAt),
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunchUrlString(link.url)) {
      await launchUrlString(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }
}
