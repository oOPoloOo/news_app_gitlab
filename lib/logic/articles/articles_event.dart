part of 'articles_bloc.dart';

abstract class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  @override
  List<Object> get props => [];
}

class LoadArticles extends ArticlesEvent {
  final String domain;
  LoadArticles({required this.domain});

  @override
  List<Object> get props => [domain];
}

class UpdateArticles extends ArticlesEvent {
  final List<Articles> articles;

  UpdateArticles(this.articles);

  @override
  List<Object> get props => [articles];
}
