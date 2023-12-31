import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/sources/bloc/sources_bloc.dart';
import 'package:news_app/sources/use_case/sources_use_case.dart';

class SourceDependencies extends StatelessWidget {
  final Widget _child;

  const SourceDependencies({
    super.key,
    required Widget child,
  }) : _child = child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SourcesBloc>(
      lazy: false,
      create: (context) => SourcesBloc(
        sourcesUseCase: SourcesUseCase(),
      )..add(LoadSources()),
      child: _child,
    );
  }
}
