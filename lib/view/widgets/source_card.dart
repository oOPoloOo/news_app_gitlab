import 'package:flutter/material.dart';
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
        Navigator.pushNamed(
          context,
          articlesRouteName, /*arguments: source*/
        );
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
                  Text(
                    sourceInfo.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    sourceInfo.description,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    // );
  }
}
