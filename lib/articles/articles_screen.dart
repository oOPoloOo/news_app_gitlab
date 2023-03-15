// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/articles/bloc/articles_bloc.dart';
import 'package:news_app/articles/helpers/article_responsiveness.dart';
import 'package:news_app/articles/model/articles_model.dart';

import 'package:news_app/common/bloc/navigation/bloc/navigation_bloc.dart';
import 'package:news_app/common/config/constants.dart';
import 'package:news_app/common/widgets/custom_appbar.dart';
import 'package:news_app/common/widgets/custom_list_view.dart';
import 'package:news_app/common/widgets/nav_bar.dart';

class ArticlesScreen extends StatefulWidget {
  static const String routeName = articlesRouteName;

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) =>
            ArticleResponsiveness(customSizeScreen: ArticlesScreen()));
  }

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  //TODO Visi parametrai turi eiti i bloc (saugomas), galioja visiem bloc.
  // pasiziuret bloc su kintamaisiais
  // List<String> choiceChipsNames = ["Todays", "10 days old", "All"];

  List<Articles> articlesFilter = [];
  bool onLoad = true;
  late ArticlesBloc _articlesBloc;
  int _selectedIndex = 2;

  @override
  void initState() {
    _articlesBloc = BlocProvider.of<ArticlesBloc>(context);
    _articlesBloc.add(
      const FilterArticles(selectedIndex: 2),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color backColor = Theme.of(context).colorScheme.background;

    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            BlocProvider.of<NavigationBloc>(context)
                .add(PopThePage(state: state, context: context));
            return Future(() => true);
          },
          child: Scaffold(
              appBar: CustomAppBar(
                screen: ArticlesScreen.routeName,
                title: "Articles Screen",
                bigSize:
                    ArticleResponsiveness.isSmallScreen(context) ? false : true,
              ),
              bottomNavigationBar: const NavBar(),
              body: _buidBody(backColor)),
        );
      },
    );
  }

  BlocBuilder<ArticlesBloc, ArticlesState> _buidBody(Color backColor) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ArticlesLoaded) {
          if (state.articles.isNotEmpty) {
            // if (onLoad) {
            //   _articlesBloc.add(
            //     FilterArticles(selectedIndex: 0),
            //   );
            //   onLoad = false;
            // }

            return Container(
              color: backColor,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      spacing: 6,
                      direction: Axis.horizontal,
                      children: choiceChips(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    flex: 14,
                    child: state.articlesFilter.isNotEmpty
                        ? CustomListView.articles(
                            articles: state.articlesFilter,
                            isBig: false, // TODOLAIKINAS
                          )
                        : const Center(
                            child: Text(
                              'No articles meet requirements',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              color: backColor,
              child: Center(
                child: Text(
                  "No data in local database about this source.",
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

  //TODO Irgi i bloc mest
  List<Widget> choiceChips() {
    List<Widget> chips = [];

    // DateTime now = DateTime.now();
    // var nowToday = DateTime(now.year, now.month, now.day);
    // var now_10d = now.subtract(const Duration(days: 10));
    // List<String> choiceChipsNames = _articlesBloc.choiceChipsNames;

    for (int i = 0; i < _articlesBloc.choiceChipsNames.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: ChoiceChip(
          label: Text(_articlesBloc.choiceChipsNames[i]),
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
          backgroundColor: Theme.of(context).colorScheme.primary,
          selected: _selectedIndex == i,
          selectedColor: Colors.black,
          side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          onSelected: (bool value) {
            _selectedIndex = i;

            // if (_selectedIndex == 0) {
            //   articlesFilter = originalArticles.where((article) {
            //     DateTime publishedAt = article.publishedAt;
            //     DateTime newPublishedAt = DateTime(
            //       publishedAt.year,
            //       publishedAt.month,
            //       publishedAt.day,
            //     );

            //     return newPublishedAt.isAtSameMomentAs(nowToday);
            //   }).toList();
            // }
            // if (_selectedIndex == 1) {
            //   articlesFilter = originalArticles.where((article) {
            //     return now_10d.isBefore(article.publishedAt);
            //   }).toList();
            // }
            // if (_selectedIndex == 2) {
            //   articlesFilter = originalArticles;
            // }
            // if (onLoad) {
            //   _articlesBloc.add(
            //     const FilterArticles(selectedIndex: 2),
            //   );
            //   onLoad = false;
            // } else {
            _articlesBloc.add(
              FilterArticles(selectedIndex: _selectedIndex),
            );
            // }
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
