import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/articles/model/articles_model.dart';

part 'article_details_state.dart';

class ArticleDetailsBloc extends Cubit<ArticleDetailsState> {
  ArticleDetailsBloc() : super(ArticleDetailsLoading());
  //Takes Article_details data from event
  //and passes it to UpdateArticlesDetails.
  void loadArticlesDetails(Articles articleSelected) {
    updateArticlesDetails(articleSelected);
  }

  //Takes Article_details data from UpdateArticlesDetails event
  //and updaates state Article bloc.
  void updateArticlesDetails(Articles articleDetails) {
    emit(ArticleDetailsLoaded(articleDetails: articleDetails));
  }
}
