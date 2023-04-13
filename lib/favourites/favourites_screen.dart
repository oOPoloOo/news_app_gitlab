// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/articles/widgets/articles_list_view.dart';
import 'package:news_app/common/config/constants.dart';
import 'package:news_app/favourites/bloc/bloc/favourites_bloc.dart';

class FavouritesScreen extends StatelessWidget {
  static const String routeName = favouritesRouteName;

  const FavouritesScreen();

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const FavouritesScreen(),
    );
  }

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
                  "No favourite articles.",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            );
          }
        } else {
          if (state is FavouritesError) {
            return const Center(
              child: Text('Something went wrong!'),
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
