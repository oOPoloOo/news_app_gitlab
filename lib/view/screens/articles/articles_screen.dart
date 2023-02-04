import 'package:flutter/material.dart';
import 'package:news_app/view/config/constants.dart';

import '../../../data/models/models_export.dart';

class ArticlesScreen extends StatelessWidget {
  static const String routeName = articlesRouteName;

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => ArticlesScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scource Name'),
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
    List<Articles> articles = Articles.articlesMap;
    return Container(
      color: Colors.green,
      child: Center(
        child: _buildSourceCardsListView(articles: articles),
      ),
    );
  }
}

//Make one custom class
class _buildSourceCardsListView extends StatelessWidget {
  final List<Articles> articles;
  const _buildSourceCardsListView({
    Key? key,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          children: articles
              .map(
                (article) => ArticleCard(
                  articleInfo: article,
                ),
              )
              .toList()),
    );
  }
}

class BuildText extends StatelessWidget {
  const BuildText({
    Key? key,
    required this.flex,
    required this.fieldLabel,
    this.constraint,
    required this.textStyle,
    // this.isHome = false,
  }) : super(key: key);

  // const BuildText.home({
  //   Key? key,
  //   required this.flex,
  //   required this.fieldLabel,
  //   this.constraint,
  //   required this.textStyle,
  //   this.isHome = true,
  // }) : super(key: key);

  final int flex;
  final String fieldLabel;
  final BoxConstraints? constraint;
  final TextStyle textStyle;
  //final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child:
            //  isHome
            //     ?
            Text(
          fieldLabel,
          style: textStyle,
        )
        // : Container(
        //     width: constraint!.biggest.width * 0.85,
        //     height: constraint!.biggest.height * 0.2,
        //     alignment: Alignment.topLeft,
        //     child: Text(fieldLabel, style: textStyle),
        //   ),
        );
  }
}

class ArticleCard extends StatelessWidget {
  final Articles articleInfo;

  const ArticleCard({
    required this.articleInfo,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              articleDetailsRouteName, /*arguments: source*/
            );
          },
          child: Container(
            width: media.width * 0.95,
            height: articleInfo.imgUrl.isNotEmpty
                ? media.height * 0.55
                : articleInfo.description.isNotEmpty
                    ? media.height * 0.40
                    : media.height * 0.15,
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  articleInfo.imgUrl.isNotEmpty
                      ? SizedBox(
                          width: media.width * 0.95,
                          height: media.height * 0.20,
                          child: Image.network(
                            articleInfo.imgUrl,
                            fit: BoxFit.fill,
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Expanded(
                      flex: 1,
                      child: Text(
                        '${articleInfo.date}',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Expanded(
                      flex: 4,
                      child: Text(
                        articleInfo.title,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  articleInfo.description.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            top: 5.0,
                          ),
                          child: Expanded(
                            flex: 6,
                            child: Text(
                              articleInfo.description,
                              textAlign: TextAlign.justify,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
