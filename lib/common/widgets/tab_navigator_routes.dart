// import 'package:flutter/material.dart';
// import 'package:news_app/common/config/constants.dart';
// import 'package:news_app/favourites/favourites_screen.dart';
// import 'package:news_app/sources/sources_screen.dart';
// import 'nav_bar.dart';
// import 'bottom_navigation.dart';

// class TabNavigatorRoutes {
//   static const String sources = sourcesRouteName;
//   static const String favourites = favouritesRouteName;
// }

// class TabNavigator extends StatelessWidget {
//   const TabNavigator({super.key, this.navigatorKey, required this.tabItem});
//   final GlobalKey<NavigatorState>? navigatorKey;
//   final String tabItem;

//   @override
//   Widget build(BuildContext context) {
//     Widget child;
//     if (tabItem == "Sources")
//       child = ScourcesScreen();
//     else
//       child = FavouritesScreen();

//     return Navigator(
//       key: navigatorKey,
//       onGenerateRoute: (routeSettings) {
//         return MaterialPageRoute(builder: (context) => child);
//       },
//     );
//   }
// }
