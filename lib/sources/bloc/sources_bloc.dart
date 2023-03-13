import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/common/api/api_client.dart';

import 'package:news_app/sources/model/sources_model.dart';
import 'package:news_app/sources/use_case/sources_use_case.dart';

part 'sources_event.dart';
part 'sources_state.dart';

class SourcesBloc extends Bloc<SourcesEvent, SourcesState> {
  SourcesUseCase sourcesUseCase;

  List<Sources> sourcesList = <Sources>[];
  late StreamSubscription networkStreamSubscription;
  late StreamSubscription watchStreamSubscription;

  @override
  SourcesBloc({
    required this.sourcesUseCase,
  }) : super(SourcesLoading()) {
    on<LoadSources>(_onLoadSources);
    on<WatchSources>(_onWatchLocalSources);
    on<UpdateSources>(_onUpdateSources);
  }

  // Starts Watching database.
  //Loads Sources from API and saves sit to local db.
  void _onLoadSources(event, Emitter<SourcesState> emit) async {
    add(WatchSources());

    try {
      await sourcesUseCase.loadSources();
    } catch (e) {
      logger.d(e);
    }
  }

  //On local db changes updates list in Sources state.
  void _onWatchLocalSources(event, Emitter<SourcesState> emit) async {
    watchStreamSubscription = sourcesUseCase.watch().listen((event) {
      sourcesList = event;
      add(UpdateSources(sourcesList));
    });
  }

  // Updates list in Sources state
  void _onUpdateSources(UpdateSources event, Emitter<SourcesState> emit) {
    emit(SourcesLoaded(sources: event.sources));
  }

  @override
  Future<void> close() async {
    networkStreamSubscription.cancel();
    watchStreamSubscription.cancel();
    return await super.close();
  }
}
