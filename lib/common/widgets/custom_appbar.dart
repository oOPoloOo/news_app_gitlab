// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/article_details/bloc/article_details_bloc.dart';
import 'package:news_app/articles/bloc/articles_bloc.dart';
import 'package:news_app/common/config/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String screen;
  final String title;
  final bool? bigSize;

  const CustomAppBar({
    required this.screen,
    required this.title,
    this.bigSize,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return (screen == articlesRouteName)
        ? _articlesAppBar(
            context,
            title,
            bigSize!,
          )
        : (screen == articleDetailsRouteName)
            ? _articleDetailsAppBar(
                context,
                bigSize!,
              )
            : _scourcesAppBar(
                context,
                title,
              );
  }

  Widget _articlesAppBar(BuildContext context, String barTitle, bool isBig) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesLoaded) {
          return AppBar(
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: isBig ? true : false,
            iconTheme:
                IconThemeData(color: Theme.of(context).colorScheme.secondary),
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text(
              state.articles.isNotEmpty
                  ? state.articles[0].idAndName.id
                  : title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          );
        } else {
          return AppBar(
            elevation: 0,
            iconTheme:
                IconThemeData(color: Theme.of(context).colorScheme.secondary),
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          );
        }
      },
    );
  }

  Widget _articleDetailsAppBar(BuildContext context, bool bigSize) {
    return BlocBuilder<ArticleDetailsBloc, ArticleDetailsState>(
      builder: (context, state) {
        if (state is ArticleDetailsLoaded) {
          return AppBar(
            toolbarHeight: 68,
            leadingWidth: 60,
            automaticallyImplyLeading: bigSize ? false : true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme:
                IconThemeData(color: Theme.of(context).colorScheme.secondary),
            title: Text(
              state.articleDetails.title,
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          );
        } else {
          return AppBar(
            toolbarHeight: 70,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              "",
              maxLines: 3,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          );
        }
      },
    );
  }

  Widget _scourcesAppBar(BuildContext context, String barTitle) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.background,
      title: Text(
        barTitle,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
