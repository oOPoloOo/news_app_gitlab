import 'package:flutter/material.dart';
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
    return (screen == sourcesRouteName || screen == articlesRouteName)
        ? SimpleAppBar(
            title: title,
          )
        : (screen == articleDetailsRouteName)
            ? ArticleDetailsAppBar(
                title: title,
              )
            : const SizedBox(
                height: 0,
                width: 0,
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
    return AppBar(
      toolbarHeight: 70,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        maxLines: 3,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: Colors.white),
      ),
    );
  }
}

class SimpleAppBar extends StatelessWidget {
  final String title;

  const SimpleAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
