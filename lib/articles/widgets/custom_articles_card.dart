// ignore_for_file: use_key_in_widget_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:news_app/article_details/bloc/article_details_bloc.dart';

import 'package:news_app/articles/bloc/articles_bloc.dart';
import 'package:news_app/articles/model/articles_model.dart';
import 'package:news_app/common/bloc/connectivity_check/network_bloc.dart';
import 'package:news_app/common/bloc/navigation/bloc/navigation_bloc.dart';
import 'package:news_app/common/config/constants.dart';
import 'package:news_app/favourites/bloc/bloc/favourites_bloc.dart';

import 'package:string_validator/string_validator.dart';

class ArticleCard extends StatelessWidget {
  final Articles articleInfo;
  final double cardWidth;
  final double cardHeightAllElements;
  final double imgHeight;

  const ArticleCard({
    required this.articleInfo,
    required this.cardWidth,
    required this.cardHeightAllElements,
    required this.imgHeight,
  });

  @override
  Widget build(BuildContext context) {
    bool isEmptyImg = true;
    bool isEmptyIDes = true;

    if (articleInfo.imageUrl != null && isURL(articleInfo.imageUrl)) {
      isEmptyImg = false;
    }

    if (articleInfo.description != null) isEmptyIDes = false;

    return Column(
      children: [
        BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<ArticleDetailsBloc>(context)
                    .add(LoadArticleDetails(articleSelected: articleInfo));

                BlocProvider.of<NavigationBloc>(context)
                    .add(GoToArticleDetails(state: state, context: context));
              },
              child: SizedBox(
                width: cardWidth,
                height: cardHeightAllElements,
                child: Card(
                  color: Theme.of(context).colorScheme.secondary,
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Column(
                    children: [
                      _buildImage(
                          context,
                          !isEmptyImg ? articleInfo.imageUrl : noImgImage,
                          cardWidth,
                          imgHeight,
                          articleInfo),
                      _buildDateText(context, articleInfo),
                      _buildTitleText(context, articleInfo),
                      !isEmptyIDes
                          ? _buildDescription(context, articleInfo)
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTitleText(BuildContext context, Articles articleInf) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5.0,
          right: 5.0,
          top: 8,
        ),
        child: AutoSizeText(
          articleInf.title,
          style: Theme.of(context).textTheme.titleSmall,
          maxLines: 3,
          minFontSize: 16,
          overflow: TextOverflow.fade,
        ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context, Articles articleInf) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 10.0,
        ),
        child: Text(
          articleInf.description,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyMedium,
          overflow: TextOverflow.fade,
          softWrap: true,
        ),
      ),
    );
  }

  Widget _buildDateText(BuildContext context, Articles articleInf) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 7.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
            width: 10,
            child: Container(color: Theme.of(context).colorScheme.background),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              DateFormat('yyyy-MM-dd hh:mm').format(articleInf.publishedAt),
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(
    BuildContext context,
    String imageUrl,
    double cWidth,
    double iHeight,
    Articles article,
  ) {
    return Stack(children: [
      SizedBox(
        width: cWidth,
        height: iHeight,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => Image.asset(
            'assets/no_nwtwork_egg.png',
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Builder(builder: (context) {
          return Container(
            alignment: Alignment.topRight,
            child: article.isFavourite!
                ? FavoriteButton(
                    isFavorite: true,
                    valueChanged: (_isFavorite) {
                      BlocProvider.of<FavouritesBloc>(context)
                          .add(RemoveFavourites(removeArticle: article));
                      BlocProvider.of<ArticlesBloc>(context)
                          .add(LoadLocalArticles(source: article.idAndName.id));
                    },
                  )
                : FavoriteButton(
                    isFavorite: false,
                    valueChanged: (_isFavorite) {
                      BlocProvider.of<FavouritesBloc>(context)
                          .add(AddFavourites(addArticle: article));
                      BlocProvider.of<ArticlesBloc>(context)
                          .add(LoadLocalArticles(source: article.idAndName.id));
                    },
                  ),
          );
        }),
      ),
    ]);
  }
}
