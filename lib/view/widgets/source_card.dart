import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/logic/bloc_export.dart';
import 'package:string_validator/string_validator.dart';
import '../../data/models/models_export.dart';
import 'package:news_app/view/config/constants.dart';

class SourceCard extends StatelessWidget {
  final Sources sourceInfo;

  const SourceCard({
    required this.sourceInfo,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, articlesRouteName);
        BlocProvider.of<ArticlesBloc>(context)
            .add(LoadArticles(source: sourceInfo.id));
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          child: Container(
            color: Colors.grey[400],
            height: media.height * 0.15,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  AutoSizeText(
                    sourceInfo.title,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    sourceInfo.description,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
