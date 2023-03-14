// ignore_for_file: override_on_non_overriding_member

part of 'articles_bloc.dart';

abstract class ArticlesState {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

class ArticlesLoading extends ArticlesState {}

class ArticlesLoaded extends ArticlesState {
  final List<Articles> articles;
  // List<String> choiceChipsNames;
  // final int selectedIndex;
  List<Articles> articlesFilter;
  // bool onLoad;

  // final Widget df;
  // List<String> choiceChipsNames = ["Todays", "10 days old", "All"];
  // int? _selectedIndex;
  // List<Articles> articlesFilter = [];
  // bool onLoad = true;

  ArticlesLoaded({
    this.articles = const <Articles>[],
    this.articlesFilter = const <Articles>[],
    // this.onLoad = true,
    // required this.df,
  });

  @override
  List<Object> get props => [
        articles,
        // selectedIndex,
        articlesFilter,
        // onLoad,
      ];
}
