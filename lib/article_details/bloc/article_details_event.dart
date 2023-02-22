part of 'article_details_bloc.dart';

abstract class ArticleDetailsEvent {
  const ArticleDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadArticleDetails extends ArticleDetailsEvent {
  Articles articleSelected;
  LoadArticleDetails({required this.articleSelected});

  @override
  List<Object> get props => [articleSelected];
}

class UpdateArticlesDetails extends ArticleDetailsEvent {
  Articles articleDetails;

  UpdateArticlesDetails(this.articleDetails);

  @override
  List<Object> get props => [articleDetails];
}
