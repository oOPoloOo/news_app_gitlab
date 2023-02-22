import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:intl/intl.dart';
import 'package:news_app/data/models/models_export.dart';
import 'package:news_app/logic/bloc_export.dart';
import 'package:news_app/view/config/constants.dart';
import 'package:string_validator/string_validator.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsCard extends StatelessWidget {
  final Articles articleInfo;

  final double cardHeight;

  final double cardWidth;

  final double imgHeight;

  const ArticleDetailsCard({
    required this.articleInfo,
    required this.cardHeight,
    required this.cardWidth,
    required this.imgHeight,
  });

  @override
  Widget build(BuildContext context) {
    bool isEmptyImg = true;

    if (articleInfo.imageUrl != null && isURL(articleInfo.imageUrl)) {
      isEmptyImg = false;
    }

    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: cardHeight,
            width: cardWidth,
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Column(
                children: [
                  _buildImage(
                    context,
                    !isEmptyImg ? articleInfo.imageUrl : noImgImage,
                    cardWidth,
                    imgHeight,
                  ),
                  Divider(
                    thickness: 30,
                    color: Colors.blueGrey[700],
                    height: 30,
                  ),
                  _buildDate(1, context, articleInfo),
                  _buildTitle(2, context, articleInfo),
                  _buildContent(6, context, articleInfo),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 5.0,
                        bottom: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "Link to original article:",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Linkify(
                              onOpen: _onOpen,
                              textScaleFactor: 1,
                              text: articleInfo.articleUrl,
                              overflow: TextOverflow.fade,
                            ),
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

  Widget _buildImage(
      BuildContext context, String imageUrl, double iWidth, double iHeight) {
    return BlocBuilder<NetworkBloc, NetworkState>(
      builder: (context, state) {
        if (state is NetworkSuccess) {
          return SizedBox(
            width: iWidth,
            height: iHeight,
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            ),
          );
        } else {
          return SizedBox(
            width: iWidth,
            height: iHeight,
            child: Image.asset(
              'assets/no_nwtwork_egg.png',
              fit: BoxFit.fill,
            ),
          );
        }
      },
    );
  }

  Widget _buildContent(int flex, BuildContext context, Articles articleInf) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 10.0,
        ),
        child: Text(
          articleInf.content,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  Widget _buildTitle(int flex, BuildContext context, Articles articleInf) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          top: 20.0,
          right: 8.0,
          bottom: 5.0,
        ),
        child: Text(
          articleInf.title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }

  Widget _buildDate(int flex, BuildContext context, Articles articleInf) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const VerticalDivider(
              color: Colors.black,
              thickness: 4,
            ),
            Text(
              DateFormat('yyyy-MM-dd hh:mm').format(articleInf.publishedAt),
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
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
