// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/article_details/bloc/article_details_bloc.dart';
// import 'package:news_app/article_details/helpers/article_details_responsiveness.dart';
import 'package:news_app/common/config/constants.dart';
import 'package:news_app/common/widgets/custom_appbar.dart';
import 'package:news_app/common/widgets/custom_list_view.dart';

class ArticleDetailsScreen extends StatelessWidget {
  static const String routeName = articleDetailsRouteName;

  final bool isBigSize;

  const ArticleDetailsScreen({
    this.isBigSize = false,
  });

  const ArticleDetailsScreen.bigSize({
    this.isBigSize = true,
  });

  // static Route route() {
  //   return MaterialPageRoute(
  //     settings: const RouteSettings(name: routeName),
  //     builder: (_) => ArticleDetailsResponsiveness(
  //       largeScreen: ArticleDetailsScreen.bigSize(),
  //       smallScreen: ArticleDetailsScreen(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        screen: routeName,
        title: "",
        bigSize: isBigSize,
      ),
      body: _buildBody(
        context,
        Theme.of(context).colorScheme.background,
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
            child: CustomListView.details(
              articleDetails: state.articleDetails,
              isBig: isBigSize ? true : false,
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
