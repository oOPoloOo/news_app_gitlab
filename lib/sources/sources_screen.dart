// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/articles/bloc/articles_bloc.dart';
import 'package:news_app/common/config/constants.dart';
import 'package:news_app/common/widgets/custom_appbar.dart';
import 'package:news_app/common/widgets/custom_list_view.dart';
import 'package:news_app/common/widgets/nav_bar.dart';
import 'package:news_app/sources/bloc/sources_bloc.dart';
import 'package:news_app/sources/dependencies/source_dependencies.dart';

class ScourcesScreen extends StatefulWidget {
  static const String routeName = sourcesRouteName;

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ScourcesScreen());
  }

  @override
  State<ScourcesScreen> createState() => SourcesScreenState();
}

class SourcesScreenState extends State<ScourcesScreen> {
  @override
  Widget build(BuildContext context) {
    return SourceDependencies(
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: const CustomAppBar(
            screen: ScourcesScreen.routeName,
            title: 'Sources Screen',
          ),
          bottomNavigationBar: const NavBar(),
          body: _buildBody(
            context,
            Theme.of(context).colorScheme.background,
          ),
        );
      }),
    );
  }

  Widget _buildBody(BuildContext context, Color backColor) {
    return BlocConsumer<SourcesBloc, SourcesState>(
      listener: (context, state) {
        if (state is SourcesLoading) {
          BlocProvider.of<SourcesBloc>(context).add(WatchSources());
        }
        if (state is SourcesLoaded) {
          BlocProvider.of<ArticlesBloc>(context)
              .add(LoadArticles(sourceList: state.sources));
        }
      },
      builder: (context, state) {
        if (state is SourcesLoading) {
          // BlocProvider.of<SourcesBloc>(context).add(WatchSources());
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SourcesLoaded) {
          // BlocProvider.of<ArticlesBloc>(context)
          //     .add(LoadArticles(sourceList: state.sources));
          return Container(
            color: backColor,
            child: CustomListView.source(
              sources: state.sources,
            ),
          );
        } else {
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
      },
    );
  }
}
