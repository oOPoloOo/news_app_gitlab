part of 'articles_bloc.dart';

abstract class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  @override
  List<Object> get props => [];
}

class LoadArticles extends ArticlesEvent {
  final String source;
  const LoadArticles({required this.source});

  @override
  List<Object> get props => [source];
}

class LoadLocalArticles extends ArticlesEvent {
  final String source;
  const LoadLocalArticles({required this.source});

  @override
  List<Object> get props => [source];
}

class UpdateArticles extends ArticlesEvent {
  final List<Articles> articles;

  const UpdateArticles(this.articles);

  @override
  List<Object> get props => [articles];
}
