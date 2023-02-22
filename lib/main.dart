import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repositories/news/news_repo.dart';
import 'package:news_app/logic/bloc_export.dart';
import 'package:news_app/view/config/app_router.dart';
import 'package:news_app/view/config/theme.dart';
import 'package:news_app/view/screens/sources/sources_screen.dart';

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
            newsRepository: NewsRepository(),
            networkBloc: context.read<NetworkBloc>(),
          )..add(LoadSources()),
        ),
        BlocProvider<ArticlesBloc>(
          create: (context) => ArticlesBloc(
            newsRepository: NewsRepository(),
          ),
        ),
        BlocProvider<ArticleDetailsBloc>(
          create: (context) =>
              ArticleDetailsBloc(newsRepository: NewsRepository()),
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
