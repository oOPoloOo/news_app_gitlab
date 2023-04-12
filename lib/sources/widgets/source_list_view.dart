import 'package:flutter/material.dart';
import 'package:news_app/sources/model/sources_model.dart';
import 'package:news_app/sources/widgets/source_card.dart';

class SourceListView extends StatelessWidget {
  final List<Sources> sources;

  const SourceListView({
    Key? key,
    required this.sources,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        children: sources
            .map(
              (source) => SourceCard(
                sourceInfo: source,
              ),
            )
            .toList());
  }
}
