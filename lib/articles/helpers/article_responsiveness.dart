import 'package:flutter/material.dart';

const int largeScreenSize = 500;

class ArticleResponsiveness extends StatelessWidget {
  final Widget customSizeScreen;

  const ArticleResponsiveness({
    super.key,
    required this.customSizeScreen,
  });

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > largeScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return customSizeScreen;
      },
    );
  }
}
