// ignore_for_file: override_on_non_overriding_member

part of 'article_details_bloc.dart';

abstract class ArticleDetailsState {
  const ArticleDetailsState();

  @override
  List<Object> get props => [];
}

class ArticleDetailsLoading extends ArticleDetailsState {}

class ArticleDetailsLoaded extends ArticleDetailsState {
  Articles articleDetails;

  ArticleDetailsLoaded({required this.articleDetails});

  @override
  List<Object> get props => [articleDetails];
}
