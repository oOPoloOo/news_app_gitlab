import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/logic/bloc_export.dart';
import 'package:news_app/view/config/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String screen;
  final String title;

  const CustomAppBar({
    required this.screen,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return (screen == articlesRouteName)
        ? ArticlesAppBar(
            title: title,
          )
        : (screen == articleDetailsRouteName)
            ? ArticleDetailsAppBar(
                title: title,
              )
            : ScourcesAppBar(
                title: title,
              );
  }
}

class ArticleDetailsAppBar extends StatelessWidget {
  final String title;

  const ArticleDetailsAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleDetailsBloc, ArticleDetailsState>(
      builder: (context, state) {
        if (state is ArticleDetailsLoaded) {
          return AppBar(
            toolbarHeight: 68,
            leadingWidth: 60,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              state.articleDetails.title,
              maxLines: 3,
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
}

class ArticlesAppBar extends StatelessWidget {
  final String title;

  const ArticlesAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesLoaded) {
          return AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Theme.of(context).backgroundColor,
            title: Text(
              state.articles[0].idAndName.id,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          );
        } else {
          return AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).backgroundColor,
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
}

class ScourcesAppBar extends StatelessWidget {
  final String title;

  const ScourcesAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
