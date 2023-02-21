import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repositories/news/news_repo.dart';
import '../../data/models/models_export.dart';
part 'article_details_event.dart';
part 'article_details_state.dart';

class ArticleDetailsBloc
    extends Bloc<ArticleDetailsEvent, ArticleDetailsState> {
  NewsRepository newsRepository;
  final articleDetails = Articles;

  ArticleDetailsBloc({required this.newsRepository})
      : super(ArticleDetailsLoading()) {
    on<LoadArticleDetails>(_onLoadArticlesDetails);
    on<UpdateArticlesDetails>(_onUpdateArticlesDetails);
  }

  void _onLoadArticlesDetails(
      LoadArticleDetails event, Emitter<ArticleDetailsState> emit) {
    add(UpdateArticlesDetails(event.articleSelected));
  }

  void _onUpdateArticlesDetails(
      UpdateArticlesDetails event, Emitter<ArticleDetailsState> emit) {
    emit(ArticleDetailsLoaded(articleDetails: event.articleDetails));
  }
}