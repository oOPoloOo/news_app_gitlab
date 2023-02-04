import 'package:flutter/material.dart';
import 'package:news_app/view/config/app_router.dart';
import 'package:news_app/view/config/theme.dart';
import 'package:news_app/view/screens/sources/sources_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: ScourcesScreen.routeName,
    );
  }
}
