// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/articles/widgets/articles_list_view.dart';
import 'package:news_app/favourites/bloc/bloc/favourites_bloc.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen();

  @override
  Widget build(BuildContext context) {
    return _buidBody();
  }

  BlocBuilder<FavouritesBloc, FavouritesState> _buidBody() {
    return BlocBuilder<FavouritesBloc, FavouritesState>(
      builder: (context, state) {
        var media = MediaQuery.of(context).size;

        if (state is FavouritesLoaded) {
          if (state.favArticles.isNotEmpty) {
            return Container(
              color: Theme.of(context).colorScheme.background,
              child: ArticlesListView(
                articles: state.favArticles,
              ),
            );
          } else {
            return Container(
              color: Theme.of(context).colorScheme.background,
              height: media.height,
              child: Center(
                child: Text(
                  "noFavourite",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                ).tr(),
              ),
            );
          }
        } else {
          if (state is FavouritesError) {
            return Center(
              child: const Text('wentWrong').tr(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      },
    );
  }
}
