import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/data/api/api_client.dart';
import 'package:news_app/data/database/local_database.dart';
import 'package:news_app/data/models/models_export.dart';
import 'package:news_app/data/repositories/news/news_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/logic/connectivity_check/network_bloc.dart';

part 'sources_event.dart';
part 'sources_state.dart';

class SourcesBloc extends Bloc<SourcesEvent, SourcesState> {
  NewsRepository newsRepository;
  NetworkBloc networkBloc;
  List<Sources> sourcesList = <Sources>[];
  late StreamSubscription networkStreamSubscription;

  @override
  SourcesBloc({required this.newsRepository, required this.networkBloc})
      : super(SourcesLoading()) {
    on<LoadSources>(_monitorNetworkCubit);
    on<UpdateSources>(_onUpdateSources);
  }

  StreamSubscription<NetworkState> _monitorNetworkCubit(
      SourcesEvent event, Emitter<SourcesState> emit) {
    return networkStreamSubscription = networkBloc.stream.listen((state) {
      // state initial neina toliau
      if (state is NetworkSuccess) {
        _onLoadSources(event, emit);
      }
      if (state is NetworkFailure) {
        _onLoadLocalSources(event, emit);
      }
    });
  }

  void _onLoadSources(event, Emitter<SourcesState> emit) async {
    try {
      sourcesList = await newsRepository.getAllSourcesByTechnologyEn();
    } on DioError catch (e) {
      logger.d(e);
    }
    saveDataToLocalDb(sourcesList);
    add(UpdateSources(sourcesList));
  }

  void _onLoadLocalSources(event, Emitter<SourcesState> emit) async {
    try {
      sourcesList = await newsRepository.readAllSourcesFromLocalDb();
    } on DioError catch (e) {
      logger.d(e);
    }

    add(UpdateSources(sourcesList));
  }

  void saveDataToLocalDb(List<Sources> sourcesList) async {
    await newsRepository.writeSourcesToLocalDb(sourcesList);
  }

  void _onUpdateSources(UpdateSources event, Emitter<SourcesState> emit) {
    logger.d("Atejo i _onUpdateSources");
    emit(SourcesLoaded(sources: event.sources));
  }

  @override
  Future<void> close() async {
    networkStreamSubscription.cancel();
    return await super.close();
  }
}
