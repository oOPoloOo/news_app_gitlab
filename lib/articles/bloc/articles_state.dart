part of 'articles_bloc.dart';

abstract class ArticlesState {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

class ArticlesLoading extends ArticlesState {}

class ArticlesLoaded extends ArticlesState {
  final List<Articles> articles;

  ArticlesLoaded({this.articles = const <Articles>[]});

  @override
  List<Object> get props => [articles];
}
