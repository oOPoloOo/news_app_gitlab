import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/bloc/connectivity_check/network_bloc.dart';
import 'package:news_app/sources/bloc/sources_bloc.dart';
import 'package:news_app/sources/use_case/sources_use_case.dart';

class SourceDependencies extends StatelessWidget {
  final Widget _child;

  const SourceDependencies({
    super.key,
    required Widget child,
  }) : _child = child;

//Toliau neina - iskviecia load sources tik karta, bet state dingsta
// 2 kart nueina iki source bloc ir tada cia ir stop -loading screen
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SourcesBloc>(
      lazy: false,
      create: (context) => SourcesBloc(
        sourcesUseCase: SourcesUseCase(),
        networkBloc: context.read<NetworkBloc>(),
      )..add(LoadSources()),
      child: _child,
    );
  }
}
