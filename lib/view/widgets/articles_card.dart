import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/logic/article_details/article_details_bloc.dart';
import 'package:news_app/logic/bloc_export.dart';
import 'package:news_app/view/config/constants.dart';
import 'package:string_validator/string_validator.dart';
import '../../data/models/models_export.dart';

class ArticleCard extends StatelessWidget {
  final Articles articleInfo;
  final double cardWidth;
  final double cardHeightAllElements;
  final double imgHeight;

  const ArticleCard({
    required this.articleInfo,
    required this.cardWidth,
    required this.cardHeightAllElements,
    required this.imgHeight,
  });

  @override
  Widget build(BuildContext context) {
    bool isEmptyImg = true;
    bool isEmptyIDes = true;

    if (articleInfo.imageUrl != null && isURL(articleInfo.imageUrl)) {
      isEmptyImg = false;
    }

    if (articleInfo.description != null) isEmptyIDes = false;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, articleDetailsRouteName);

            BlocProvider.of<ArticleDetailsBloc>(context)
                .add(LoadArticleDetails(articleSelected: articleInfo));
          },
          child: SizedBox(
            width: cardWidth,
            height: cardHeightAllElements,
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Column(
                children: [
                  _buildImage(
                    context,
                    !isEmptyImg ? articleInfo.imageUrl : noImgImage,
                    cardWidth,
                    imgHeight,
                  ),
                  _buildDateText(context, articleInfo),
                  _buildTitleText(context, articleInfo),
                  !isEmptyIDes
                      ? _buildDescription(context, articleInfo)
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

  Widget _buildTitleText(BuildContext context, Articles articleInf) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5.0,
          right: 5.0,
          top: 8,
        ),
        child: AutoSizeText(
          articleInf.title,
          style: Theme.of(context).textTheme.titleSmall,
          maxLines: 3,
          minFontSize: 16,
          overflow: TextOverflow.fade,
        ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context, Articles articleInf) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 10.0,
        ),
        child: Text(
          articleInf.description,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyMedium,
          overflow: TextOverflow.fade,
          softWrap: true,
        ),
      ),
    );
  }

  Widget _buildDateText(BuildContext context, Articles articleInf) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 7.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
            width: 10,
            child: Container(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              DateFormat('yyyy-MM-dd hh:mm').format(articleInf.publishedAt),
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(
    BuildContext context,
    String imageUrl,
    double cWidth,
    double iHeight,
  ) {
    return BlocBuilder<NetworkBloc, NetworkState>(
      builder: (context, state) {
        if (state is NetworkSuccess) {
          return SizedBox(
            width: cWidth,
            height: iHeight,
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            ),
          );
        } else {
          return SizedBox(
            width: cWidth,
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
}
