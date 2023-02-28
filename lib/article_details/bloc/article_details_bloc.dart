import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/articles/model/articles_model.dart';

part 'article_details_event.dart';
part 'article_details_state.dart';

class ArticleDetailsBloc
    extends Bloc<ArticleDetailsEvent, ArticleDetailsState> {
  ArticleDetailsBloc() : super(ArticleDetailsLoading()) {
    on<LoadArticleDetails>(_onLoadArticlesDetails);
    on<UpdateArticlesDetails>(_onUpdateArticlesDetails);
  }

  //Takes Article_details data from event
  //and passes it to UpdateArticlesDetails.
  void _onLoadArticlesDetails(
      LoadArticleDetails event, Emitter<ArticleDetailsState> emit) {
    add(UpdateArticlesDetails(event.articleSelected));
  }

  //Takes Article_details data from UpdateArticlesDetails event
  //and updaates state Article bloc.
  void _onUpdateArticlesDetails(
      UpdateArticlesDetails event, Emitter<ArticleDetailsState> emit) {
    emit(ArticleDetailsLoaded(articleDetails: event.articleDetails));
  }
}
