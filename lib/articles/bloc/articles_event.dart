part of 'articles_bloc.dart';

abstract class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  @override
  List<Object> get props => [];
}

class LoadArticles extends ArticlesEvent {
  final List<Sources> sourceList;
  // final Widget df;
  const LoadArticles({
    required this.sourceList,
    // required this.df,
  });

  @override
  List<Object> get props => [
        sourceList,
        // df,
      ];
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
