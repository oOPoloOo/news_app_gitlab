import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/data/api/api_client.dart';
import 'package:news_app/data/models/models_export.dart';
import 'package:news_app/data/repositories/news/news_repo.dart';

part 'sources_event.dart';
part 'sources_state.dart';

class SourcesBloc extends Bloc<SourcesEvent, SourcesState> {
  NewsRepository newsRepository;
  List<Sources> sourcesList = <Sources>[];

  @override
  SourcesBloc({required this.newsRepository}) : super(SourcesLoading()) {
    on<LoadSources>(_onLoadSources);
    on<UpdateSources>(_onUpdateSources);
  }

  void _onLoadSources(event, Emitter<SourcesState> emit) async {
    try {
      sourcesList = await newsRepository.getAllSourcesByTechnologyEn();
    } on DioError catch (e) {
      logger.d(e);
    }

    emit(SourcesLoaded(sources: sourcesList));
  }

  void _onUpdateSources(UpdateSources event, Emitter<SourcesState> emit) {
    logger.d("Atejo i _onUpdateSources");
    emit(SourcesLoaded(sources: event.sources));
  }
}
