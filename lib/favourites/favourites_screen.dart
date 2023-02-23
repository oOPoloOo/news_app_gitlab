// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:news_app/common/config/constants.dart';
import 'package:news_app/common/widgets/nav_bar.dart';

class FavouritesScreen extends StatelessWidget {
  static const String routeName = favouritesRouteName;

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => FavouritesScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(),
      body: Container(
        child: const Center(
          child: Text(
            'Favourites Screen',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
