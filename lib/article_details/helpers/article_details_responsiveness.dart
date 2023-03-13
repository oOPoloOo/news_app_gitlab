import 'package:flutter/material.dart';

const int largeScreenSize = 500;

class ArticleDetailsResponsiveness extends StatelessWidget {
  final Widget largeScreen;

  final Widget smallScreen;

  const ArticleDetailsResponsiveness({
    super.key,
    required this.largeScreen,
    required this.smallScreen,
  });

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > largeScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double _width = constraints.maxWidth;
        if (_width >= largeScreenSize) {
          return largeScreen;
        } else {
          return smallScreen;
        }
      },
    );
  }
}
