// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/article_details/bloc/article_details_bloc.dart';
import 'package:news_app/article_details/widgets/article_details_list_view.dart';
import 'package:news_app/common/bloc/navigation/bloc/navigation_bloc.dart';
import 'package:news_app/common/config/constants.dart';
import 'package:news_app/common/widgets/custom_appbar.dart';

class ArticleDetailsScreen extends StatelessWidget {
  static const String routeName = articleDetailsRouteName;

  final bool isBigSize;

  const ArticleDetailsScreen({
    this.isBigSize = false,
  });

  const ArticleDetailsScreen.bigSize({
    this.isBigSize = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            BlocProvider.of<NavigationBloc>(context).popThePage(context, state);
            // If return true will pop
            return Future(() => true);
          },
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(
              screen: routeName,
              title: "",
              bigSize: isBigSize,
            ),
            body: _buildBody(context),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
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
            color: Theme.of(context).colorScheme.background,
            child: ArticleDetailsView(
              articleDetails: state.articleDetails,
              isBig: isBigSize ? true : false,
            ),
          );
        } else {
          return Center(
            child: Text('wentWrong').tr(),
          );
        }
      },
    );
  }
}
