import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/common/api/api_client.dart';
import 'package:news_app/common/bloc/connectivity_check/network_bloc.dart';
import 'package:news_app/sources/model/sources_model.dart';
import 'package:news_app/sources/use_case/sources_use_case.dart';

part 'sources_event.dart';
part 'sources_state.dart';

class SourcesBloc extends Bloc<SourcesEvent, SourcesState> {
  SourcesUseCase sourcesUseCase;
  NetworkBloc networkBloc;
  List<Sources> sourcesList = <Sources>[];
  late StreamSubscription networkStreamSubscription;
  late StreamSubscription sourcesStreamSubscription;

  @override
  SourcesBloc({required this.sourcesUseCase, required this.networkBloc})
      : super(SourcesLoading()) {
    on<LoadSources>(_monitorNetworkCubit);
    on<WatchSources>(_onWatchLocalSources);
    on<UpdateSources>(_onUpdateSources);
  }

  StreamSubscription<NetworkState> _monitorNetworkCubit(
      SourcesEvent event, Emitter<SourcesState> emit) {
    return networkStreamSubscription = networkBloc.stream.listen((state) {
      if (state is NetworkSuccess) {
        _onLoadSources(event, emit);
      }

      add(WatchSources());
    });
  }

  void _onLoadSources(event, Emitter<SourcesState> emit) async {
    try {
      await sourcesUseCase.loadSources();
    } on DioError catch (e) {
      logger.d(e);
    }
  }

  void _onWatchLocalSources(event, Emitter<SourcesState> emit) async {
    sourcesUseCase.watch().listen((event) {
      logger.d('Source event: ${event.length}');
      sourcesList = event;
      add(UpdateSources(sourcesList));
    });
  }

  void _onUpdateSources(UpdateSources event, Emitter<SourcesState> emit) {
    emit(SourcesLoaded(sources: event.sources));
  }

  @override
  Future<void> close() async {
    networkStreamSubscription.cancel();
    return await super.close();
  }
}
