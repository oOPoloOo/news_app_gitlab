import 'package:flutter/material.dart';
import 'package:news_app/data/models/models_export.dart';
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
    List<Sources> sources = Sources.sourcesMap;
    return Container(
      color: backColor,
      child: CustomListView.source(
        sources: sources,
      ),
    );
  }
}
