// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/article_details/bloc/article_details_bloc.dart';
import 'package:news_app/articles/bloc/articles_bloc.dart';
import 'package:news_app/articles/use_case/articles_use_case.dart';
import 'package:news_app/common/bloc/navigation/bloc/navigation_bloc.dart';
import 'package:news_app/common/config/theme.dart';
import 'package:news_app/favourites/bloc/bloc/favourites_bloc.dart';
import 'package:news_app/splash/splash_screen.dart';

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
          BlocProvider<NavigationBloc>(
              create: (context) => NavigationBloc(
                    articlesBloc: context.read<ArticlesBloc>(),
                  )),
          BlocProvider<ArticleDetailsBloc>(
            create: (context) => ArticleDetailsBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'News App',
          theme: theme(),
          home: SplashScreen(),
        ));
  }
}
