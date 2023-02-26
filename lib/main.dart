// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/article_details/bloc/article_details_bloc.dart';
import 'package:news_app/articles/bloc/articles_bloc.dart';
import 'package:news_app/articles/use_case/articles_use_case.dart';
import 'package:news_app/common/bloc/connectivity_check/network_bloc.dart';
import 'package:news_app/common/config/app_router.dart';
import 'package:news_app/common/config/theme.dart';
import 'package:news_app/favourites/bloc/bloc/favourites_bloc.dart';
import 'package:news_app/sources/bloc/sources_bloc.dart';

import 'package:news_app/sources/sources_screen.dart';
import 'package:news_app/sources/use_case/sources_use_case.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NetworkBloc>(
          create: (context) => NetworkBloc()..add(NetworkObserve()),
        ),
        BlocProvider<SourcesBloc>(
          lazy: false,
          create: (context) => SourcesBloc(
            sourcesUseCase: SourcesUseCase(),
            networkBloc: context.read<NetworkBloc>(),
          )..add(LoadSources()),
        ),
        BlocProvider<FavouritesBloc>(
          lazy: false,
          create: (context) => FavouritesBloc(
            articlesUseCase: ArticlesUseCase(),
          )..add(LoadFavourites()),
        ),
        BlocProvider<ArticlesBloc>(
          create: (context) => ArticlesBloc(
            articlesUseCase: ArticlesUseCase(),
          ),
        ),
        BlocProvider<ArticleDetailsBloc>(
          create: (context) => ArticleDetailsBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'News App',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: ScourcesScreen.routeName,
      ),
    );
  }
}
