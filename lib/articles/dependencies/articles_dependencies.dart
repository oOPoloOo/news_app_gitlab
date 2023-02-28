import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/articles/bloc/articles_bloc.dart';
import 'package:news_app/articles/use_case/articles_use_case.dart';

class ArticlesDependencies extends StatelessWidget {
  final Widget _child;

  const ArticlesDependencies({
    super.key,
    required Widget child,
  }) : _child = child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticlesBloc>(
      lazy: false,
      create: (context) => ArticlesBloc(
        articlesUseCase: ArticlesUseCase(),
      ),
      child: _child,
    );
  }
}
