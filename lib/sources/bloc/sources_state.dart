// ignore_for_file: override_on_non_overriding_member

part of 'sources_bloc.dart';

abstract class SourcesState {
  const SourcesState();

  @override
  List<Object> get props => [];
}

class SourcesLoading extends SourcesState {}

class SourcesLoaded extends SourcesState {
  final List<Sources> sources;

  SourcesLoaded({this.sources = const <Sources>[]});

  @override
  List<Object> get props => [sources];
}

class SourcesError extends SourcesState {}
