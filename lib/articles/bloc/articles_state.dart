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

  List<Articles> articlesFilter;

  ArticlesLoaded({
    this.articles = const <Articles>[],
    this.articlesFilter = const <Articles>[],
  });

  @override
  List<Object> get props => [
        articles,
        articlesFilter,
      ];
}

class ArticlesError extends ArticlesState {}
