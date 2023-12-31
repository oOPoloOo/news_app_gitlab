// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/articles/bloc/articles_bloc.dart';
import 'package:news_app/common/bloc/navigation/bloc/navigation_bloc.dart';
import 'package:news_app/sources/model/sources_model.dart';

class SourceCard extends StatelessWidget {
  final Sources sourceInfo;

  const SourceCard({
    required this.sourceInfo,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            BlocProvider.of<ArticlesBloc>(context)
                .watchLocalArticles(sourceInfo.id);

            BlocProvider.of<NavigationBloc>(context)
                .goToArticles(context, state);
          },
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                height: media.height * 0.15,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        sourceInfo.title,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 1,
                      ),
                      Expanded(
                        child: Text(
                          sourceInfo.description,
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
