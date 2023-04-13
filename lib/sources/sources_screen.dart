// ignore_for_file: use_key_in_widget_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/articles/bloc/articles_bloc.dart';
import 'package:news_app/sources/bloc/sources_bloc.dart';
import 'package:news_app/sources/dependencies/source_dependencies.dart';
import 'package:news_app/sources/widgets/source_list_view.dart';

class ScourcesScreen extends StatefulWidget {
  @override
  State<ScourcesScreen> createState() => SourcesScreenState();
}

class SourcesScreenState extends State<ScourcesScreen> {
  @override
  Widget build(BuildContext context) {
    return SourceDependencies(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocConsumer<SourcesBloc, SourcesState>(
      listenWhen: (previous, current) {
        return previous is SourcesLoading && current is SourcesLoaded;
      },
      listener: (context, state) {
        if (state is SourcesLoaded) {
          BlocProvider.of<ArticlesBloc>(context).loadArticles(state.sources);
        }
      },
      builder: (context, state) {
        if (state is SourcesLoading) {
          BlocProvider.of<SourcesBloc>(context).add(WatchSources());
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SourcesLoaded) {
          return Container(
            color: Theme.of(context).colorScheme.background,
            child: SourceListView(
              sources: state.sources,
            ),
          );
        } else {
          return Center(
            child: const Text('wentWrong').tr(),
          );
        }
      },
    );
  }
}
