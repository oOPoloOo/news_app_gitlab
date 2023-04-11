// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/articles/bloc/articles_bloc.dart';
import 'package:news_app/articles/helpers/article_responsiveness.dart';
import 'package:news_app/common/bloc/navigation/bloc/navigation_bloc.dart';
import 'package:news_app/common/config/constants.dart';
import 'package:news_app/common/widgets/custom_appbar.dart';
import 'package:news_app/common/widgets/custom_list_view.dart';
import 'package:news_app/common/widgets/nav_bar.dart';

class ArticlesScreen extends StatefulWidget {
  static const String routeName = articlesRouteName;

// TODO : dings, kai keisiu i route without name  static Route route() {
  // Google : How to push navigation in flutter
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
  late ArticlesBloc _articlesBloc;
  // TODO : after remaking navbar not needed
  // TODO : move to bloc
  int _selectedIndex = 2;

  @override
  void initState() {
    _articlesBloc = BlocProvider.of<ArticlesBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color backColor = Theme.of(context).colorScheme.background;
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
              bottomNavigationBar: const NavBar(),
              // TODO : kaip parametro nepadavinet naudot kvieciant iskart metode
              body: _buildBody(backColor)),
        );
      },
    );
  }

  BlocBuilder<ArticlesBloc, ArticlesState> _buildBody(Color backColor) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ArticlesLoaded) {
          if (state.articles.isNotEmpty) {
            return Container(
              color: backColor,
              child: Column(
                children: [
                  Expanded(
                    // TODO: Nereik nurodyt, nes defautl yra 1
                    flex: 1,
                    child: Wrap(
                      spacing: 6,
                      direction: Axis.horizontal,
                      // TODO : pradet visad _build
                      children: choiceChips(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    flex: 14,
                    child:
                        // TODO : if issikelt i atskira _build metoda
                        state.articlesFilter.isNotEmpty
                            ? CustomListView.articles(
                                articles: state.articlesFilter,
                                isBig: false, // TODO LAIKINAS
                              )
                            : const Center(
                                child: Text(
                                  'No articles meet requirements',
                                  // TODO : naudot style is klases visur
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                  ),
                ],
              ),
            );
          } else {
            // TODO : vietoj situ elsu det bloc dar viena error state su try catch ir jei jis tada rodyt.
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

  List<Widget> choiceChips() {
    // TODO : istrint ir su map padaryt be jo
    List<Widget> chips = [];

// TODO : for to map
    for (int i = 0; i < _articlesBloc.choiceChipsNames.length; i++) {
      Widget item = Padding(
        // TODO : make paddings not odd
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

            _articlesBloc.filterArticles(_selectedIndex);
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
