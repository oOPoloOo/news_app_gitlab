// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/logic/bloc_export.dart';
import 'package:news_app/view/config/constants.dart';
import 'package:news_app/view/widgets/custom_list_view.dart';
import 'package:news_app/view/widgets/widgets_export.dart';

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
        title: "",
      ),
      body: _buildBody(
        context,
        Theme.of(context).backgroundColor,
      ),
    );
  }

  Widget _buildBody(BuildContext context, Color backColor) {
    var media = MediaQuery.of(context).size;

    return BlocBuilder<ArticleDetailsBloc, ArticleDetailsState>(
      builder: (context, state) {
        if (state is ArticleDetailsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ArticleDetailsLoaded) {
          return Container(
            height: media.height,
            width: media.width,
            color: backColor,
            child: CustomListView.details(articleDetails: state.articleDetails),
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
