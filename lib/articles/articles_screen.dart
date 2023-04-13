// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/articles/bloc/articles_bloc.dart';
import 'package:news_app/articles/helpers/article_responsiveness.dart';
import 'package:news_app/articles/model/articles_model.dart';
import 'package:news_app/articles/widgets/articles_list_view.dart';
import 'package:news_app/common/bloc/navigation/bloc/navigation_bloc.dart';
import 'package:news_app/common/config/constants.dart';
import 'package:news_app/common/widgets/custom_appbar.dart';

class ArticlesScreen extends StatefulWidget {
  static const String routeName = articlesRouteName;

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  late ArticlesBloc _articlesBloc;

  // TODO : move to bloc
  int _selectedIndex = 2;

  @override
  void initState() {
    _articlesBloc = BlocProvider.of<ArticlesBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _articlesBloc.filterArticles(2);

    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            BlocProvider.of<NavigationBloc>(context).popThePage(context, state);
            return Future(() => true);
          },
          child: Scaffold(
              appBar: CustomAppBar(
                screen: ArticlesScreen.routeName,
                title: "Articles Screen",
                bigSize:
                    ArticleResponsiveness.isSmallScreen(context) ? false : true,
              ),
              body: _buildBody()),
        );
      },
    );
  }

  BlocBuilder<ArticlesBloc, ArticlesState> _buildBody() {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesLoaded) {
          if (state.articles.isNotEmpty) {
            return Container(
              color: Theme.of(context).colorScheme.background,
              child: Column(
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 6,
                      direction: Axis.horizontal,
                      children: _buildChoiceChips(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                      flex: 14,
                      child: _buildArticlesListView(state.articlesFilter)),
                ],
              ),
            );
          } else {
            return Container(
              color: Theme.of(context).colorScheme.background,
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
          if (state is ArticlesError) {
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

  Widget _buildArticlesListView(List<Articles> articlesFilter) {
    if (articlesFilter.isNotEmpty) {
      return ArticlesListView(
        articles: articlesFilter,
      );
    } else {
      return Center(
        child: Text(
          'No articles meet requirements',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
              ),
        ),
      );
    }
  }

  List<Widget> _buildChoiceChips() {
    // TODO : istrint ir su map padaryt be jo
    List<Widget> chips = [];

// TODO : for to map
    for (int i = 0; i < _articlesBloc.choiceChipsNames.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 6),
        child: ChoiceChip(
          label: Text(_articlesBloc.choiceChipsNames[i]),
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
          backgroundColor: Theme.of(context).colorScheme.primary,
          selected: _selectedIndex == i,
          selectedColor: Colors.black,
          side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          onSelected: (bool value) {
            _selectedIndex = i;

            _articlesBloc.filterArticles(_selectedIndex);
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
