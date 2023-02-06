import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/logic/bloc_export.dart';
import 'package:news_app/view/config/constants.dart';
import 'package:news_app/view/widgets/custom_list_view.dart';
import 'package:news_app/view/widgets/widgets_export.dart';

class ScourcesScreen extends StatelessWidget {
  static const String routeName = sourcesRouteName;

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ScourcesScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        screen: routeName,
        title: 'Sources Screen',
      ),
      body: _buildBody(
        backColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}

class _buildBody extends StatelessWidget {
  const _buildBody({
    Key? key,
    required this.backColor,
  }) : super(key: key);

  final Color? backColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourcesBloc, SourcesState>(
      builder: (context, state) {
        if (state is SourcesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SourcesLoaded) {
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
