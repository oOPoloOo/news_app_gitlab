import 'package:flutter/material.dart';
import 'package:news_app/data/models/models_export.dart';
import 'package:news_app/view/config/constants.dart';

class ScourcesScreen extends StatelessWidget {
  static const String routeName = sourcesRouteName;

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => ScourcesScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nothing'),
      ),
      body: _buildBody(
        backColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}

class _buildBody extends StatelessWidget {
  const _buildBody({
    Key? key,
    required this.backColor,
  }) : super(key: key);

  final Color? backColor;

  @override
  Widget build(BuildContext context) {
    List<Sources> sources = Sources.sourcesMap;
    return Container(
      color: Colors.grey,
      child: _buildSourceCardsListView(
        sources: sources,
      ),
    );
  }
}

//Make one custom class
class _buildSourceCardsListView extends StatelessWidget {
  final List<Sources> sources;
  const _buildSourceCardsListView({
    Key? key,
    required this.sources,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // Expanded(
        //   child:
        ListView(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      children: sources
          .map(
            (source) => SourceCard(
              sourceInfo: source,
            ),
          )
          .toList(),
    );
    //);
  }
}

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
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  Text(
                    sourceInfo.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18, color: Colors.black),
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
