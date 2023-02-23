part of 'sources_bloc.dart';

abstract class SourcesEvent extends Equatable {
  const SourcesEvent();

  @override
  List<Object> get props => [];
}

class LoadSources extends SourcesEvent {}

class UpdateSources extends SourcesEvent {
  final List<Sources> sources;

  const UpdateSources(this.sources);

  @override
  List<Object> get props => [sources];
}
