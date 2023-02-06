import 'package:flutter_bloc/flutter_bloc.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc() : super(ArticlesInitial()) {
    on<ArticlesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
