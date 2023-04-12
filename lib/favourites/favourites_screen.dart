// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/articles/widgets/articles_list_view.dart';
import 'package:news_app/common/config/constants.dart';
import 'package:news_app/common/widgets/custom_appbar.dart';
import 'package:news_app/common/widgets/nav_bar.dart';
import 'package:news_app/favourites/bloc/bloc/favourites_bloc.dart';

class FavouritesScreen extends StatelessWidget {
  static const String routeName = favouritesRouteName;
  int? inheritedIndex;

  FavouritesScreen({
    this.inheritedIndex,
  });

  static Route route({int? inheritedIndex}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => FavouritesScreen(
        inheritedIndex: inheritedIndex,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        screen: favouritesRouteName,
        title: 'Favourite Articles',
      ),
      bottomNavigationBar: NavBar(
        inheritedIndex: inheritedIndex,
      ),
      body: _buidBody(),
    );
  }

  BlocBuilder<FavouritesBloc, FavouritesState> _buidBody() {
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
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
      },
    );
  }
}
