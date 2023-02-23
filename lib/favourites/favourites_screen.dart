// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/config/constants.dart';
import 'package:news_app/common/widgets/custom_list_view.dart';
import 'package:news_app/common/widgets/nav_bar.dart';
import 'package:news_app/favourites/bloc/bloc/favourites_bloc.dart';

class FavouritesScreen extends StatelessWidget {
  static const String routeName = favouritesRouteName;

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => FavouritesScreen());
  }

  @override
  Widget build(BuildContext context) {
    Color backColor = Theme.of(context).colorScheme.background;

    return Scaffold(
        bottomNavigationBar: const NavBar(), body: _buidBody(backColor));
  }

  BlocBuilder<FavouritesBloc, FavouritesState> _buidBody(Color backColor) {
    return BlocBuilder<FavouritesBloc, FavouritesState>(
      builder: (context, state) {
        var media = MediaQuery.of(context).size;

        if (state is FavouritesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FavouritesLoaded) {
          if (state.favArticles.isNotEmpty) {
            return Container(
              color: backColor,
              height: media.height,
              child: CustomListView.favourites(
                articles: state.favArticles,
              ),
            );
          } else {
            return Container(
              color: backColor,
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
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
      },
    );
  }
}
