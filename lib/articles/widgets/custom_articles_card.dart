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
import 'package:news_app/common/bloc/navigation/bloc/navigation_bloc.dart';
import 'package:news_app/favourites/bloc/bloc/favourites_bloc.dart';

class ArticleCard extends StatelessWidget {
  final Articles articleInfo;
  final double imgHeight;

  const ArticleCard({
    required this.articleInfo,
    required this.imgHeight,
  });

  @override
  Widget build(BuildContext context) {
    bool isEmptyDescription = true;

    if (articleInfo.description != null) isEmptyDescription = false;

    return Column(
      children: [
        BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<ArticleDetailsBloc>(context)
                    .loadArticlesDetails(articleInfo);

                BlocProvider.of<NavigationBloc>(context)
                    .goToArticleDetails(context, state);
              },
              child: Container(
                constraints: const BoxConstraints(minHeight: 300),
                child: Card(
                  color: Theme.of(context).colorScheme.secondary,
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      _buildImage(
                        context,
                        articleInfo.imageUrl,
                        imgHeight,
                        articleInfo,
                      ),
                      _buildDateText(context, articleInfo),
                      _buildTitleText(context, articleInfo),
                      if (!isEmptyDescription)
                        _buildDescription(context, articleInfo),
                      const SizedBox(height: 10),
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
    return Padding(
      padding: const EdgeInsets.only(
        left: 6,
        right: 6,
        top: 8,
      ),
      child: AutoSizeText(
        articleInf.title,
        style: Theme.of(context).textTheme.titleSmall,
        maxLines: 3,
        minFontSize: 16,
        overflow: TextOverflow.fade,
      ),
    );
  }

  Widget _buildDescription(BuildContext context, Articles articleInf) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      child: Text(
        articleInf.description,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyMedium,
        overflow: TextOverflow.fade,
        softWrap: true,
      ),
    );
  }

  Widget _buildDateText(BuildContext context, Articles articleInf) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 26,
            width: 10,
            child: Container(color: Theme.of(context).colorScheme.background),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
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
    String? imageUrl,
    double iHeight,
    Articles article,
  ) {
    return Stack(
      children: [
        SizedBox(
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
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Builder(builder: (context) {
            return Container(
              alignment: Alignment.topRight,
              child: article.isFavourite!
                  ? FavoriteButton(
                      isFavorite: true,
                      valueChanged: (isFavorite) {
                        BlocProvider.of<FavouritesBloc>(context)
                            .add(RemoveFavourites(removeArticle: article));
                        BlocProvider.of<ArticlesBloc>(context)
                            .watchLocalArticles(article.idAndName.id);
                      },
                    )
                  : FavoriteButton(
                      isFavorite: false,
                      valueChanged: (isFavorite) {
                        BlocProvider.of<FavouritesBloc>(context)
                            .add(AddFavourites(addArticle: article));
                        BlocProvider.of<ArticlesBloc>(context)
                            .watchLocalArticles(article.idAndName.id);
                      },
                    ),
            );
          }),
        ),
      ],
    );
  }
}
