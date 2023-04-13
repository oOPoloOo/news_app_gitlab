// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/bloc/navigation/bloc/navigation_bloc.dart';
import 'package:news_app/common/config/constants.dart';
import 'package:news_app/common/widgets/custom_appbar.dart';
import 'package:news_app/favourites/favourites_screen.dart';
import 'package:news_app/sources/sources_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomSelectedIndex = 0;
  late NavigationBloc _navigationBloc;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Scources',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Favourites',
      ),
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        ScourcesScreen(),
        FavouritesScreen(),
      ],
    );
  }

  @override
  void initState() {
    _navigationBloc = BlocProvider.of<NavigationBloc>(context);
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            // Made so dont pop in HomeScreen
            return Future(() => false);
          },
          child: Scaffold(
            appBar: CustomAppBar(
              screen: bottomSelectedIndex == 0
                  ? sourcesRouteName
                  : favouritesRouteName,
              title:
                  bottomSelectedIndex == 0 ? 'Sources' : 'Favourite Articles',
            ),
            body: buildPageView(),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: bottomSelectedIndex,
              onTap: (index) {
                bottomTapped(index);
              },
              items: buildBottomNavBarItems(),
            ),
          ),
        );
      },
    );
  }
}
