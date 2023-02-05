// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:news_app/view/config/constants.dart';
import 'package:news_app/view/widgets/custom_list_view.dart';
import 'package:news_app/view/widgets/widgets_export.dart';
import '../../../data/models/models_export.dart';

class ArticleDetailsScreen extends StatelessWidget {
  static const String routeName = articleDetailsRouteName;

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ArticleDetailsScreen());
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        screen: routeName,
        title:
            "Kazkas ko vistiek nesimatis (Title) ir dar daug visko prirasyta ziurim kiek traukia sitas gruzovykas. Labas rytas.",
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
    List<ArticleDetails> articleDetails = ArticleDetails.articleDetailsMap;
    var media = MediaQuery.of(context).size;
    return Container(
      height: media.height,
      width: media.width,
      color: Colors.black,
      child: CustomListView.details(articleDetails: articleDetails[2]),
    );
  }
}
