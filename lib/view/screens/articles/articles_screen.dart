import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/models/models_export.dart';
import 'package:news_app/logic/bloc_export.dart';
import 'package:news_app/view/config/constants.dart';
import 'package:news_app/view/widgets/custom_list_view.dart';
import 'package:news_app/view/widgets/widgets_export.dart';

class ArticlesScreen extends StatefulWidget {
  static const String routeName = articlesRouteName;

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ArticlesScreen());
  }

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  List<String> choiceChipsNames = ["Todays", "10 days old", "All"];
  int? _selectedIndex;
  List<Articles> articlesFilter = [];
  bool onLoad = true;

  @override
  Widget build(BuildContext context) {
    Color backColor = Theme.of(context).backgroundColor;

    return Scaffold(
        appBar: const CustomAppBar(
          screen: ArticlesScreen.routeName,
          title: "Articles Screen",
        ),
        body: _buidBody(backColor));
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
          if (state.articles.length != 0) {
            if (onLoad) {
              articlesFilter = state.articles;
              onLoad = false;

              //FIX: Called while buiding
              Future.delayed(Duration.zero, () async {
                setState(() {
                  articlesFilter = state.articles;
                  onLoad = false;
                });
              });
            }

            return Container(
              color: backColor,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      spacing: 6,
                      direction: Axis.horizontal,
                      children: choiceChips(state.articles),
                    ),
                  ),
                  Expanded(
                    flex: 14,
                    child: articlesFilter.isNotEmpty
                        ? CustomListView.articles(articles: articlesFilter)
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

  List<Widget> choiceChips(List<Articles> originalArticles) {
    List<Widget> chips = [];

    DateTime now = DateTime.now();
    var nowToday = DateTime(now.year, now.month, now.day);
    var now_10d = now.subtract(const Duration(days: 10));

    for (int i = 0; i < choiceChipsNames.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: ChoiceChip(
          label: Text(choiceChipsNames[i]),
          labelStyle: const TextStyle(color: Colors.white),
          backgroundColor: Colors.grey[800],
          selected: _selectedIndex == i,
          selectedColor: Colors.black,
          side: BorderSide(color: Colors.white),
          onSelected: (bool value) {
            setState(() {
              _selectedIndex = i;

              if (_selectedIndex == 0) {
                articlesFilter = originalArticles.where((article) {
                  DateTime publishedAt = article.publishedAt;
                  DateTime newPublishedAt = DateTime(
                    publishedAt.year,
                    publishedAt.month,
                    publishedAt.day,
                  );

                  return newPublishedAt.isAtSameMomentAs(nowToday);
                }).toList();
              }
              if (_selectedIndex == 1) {
                articlesFilter = originalArticles.where((article) {
                  return now_10d.isBefore(article.publishedAt);
                }).toList();
              }
              if (_selectedIndex == 2) {
                articlesFilter = originalArticles;
              }
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
