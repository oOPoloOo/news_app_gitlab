// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:news_app/view/config/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/models_export.dart';

class ArticleDetailsScreen extends StatelessWidget {
  static const String routeName = articleDetailsRouteName;

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ArticleDetailsScreen());
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //title: const Text('Kazkas ko vistiek nesimatis (Title)'),

        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size(0.0, media.height * 0.16),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Kazkas ko vistiek nesimatis (Title) ir dar daug visko prirasyta",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ),
        ),
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
    List<ArticleDetails> articleDetails = ArticleDetails.articleDetailsMap;
    var media = MediaQuery.of(context).size;
    return Container(
      height: media.height,
      width: media.width,
      color: Colors.black,
      child: _buildSourceCardsListView(articleDetails: articleDetails[2]),
    );
  }
}

//Make one custom class
class _buildSourceCardsListView extends StatelessWidget {
  final ArticleDetails articleDetails;
  const _buildSourceCardsListView({
    Key? key,
    required this.articleDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleDetailsCard(
      articleInfo: articleDetails,
    );
  }
}

class ArticleDetailsCard extends StatelessWidget {
  final ArticleDetails articleInfo;

  const ArticleDetailsCard({
    required this.articleInfo,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    Uri toLaunch = Uri(scheme: 'https', host: 'www.github.com');
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: media.height,
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Column(
                children: [
                  articleInfo.imgUrl.isNotEmpty
                      ? SizedBox(
                          width: media.width * 0.95,
                          height: media.height * 0.25,
                          child: Image.network(
                            articleInfo.imgUrl,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const VerticalDivider(
                            color: Colors.black,
                            thickness: 4,
                          ),
                          Text(
                            '${articleInfo.date}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        top: 20.0,
                        right: 8.0,
                        bottom: 5.0,
                      ),
                      child: Text(
                        articleInfo.title,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 10.0,
                      ),
                      child: Text(
                        articleInfo.content,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 5.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "Link to original article:",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Linkify(
                            onOpen: _onOpen,
                            textScaleFactor: 1,
                            text: articleInfo.articleUrl,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }
}
