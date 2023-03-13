// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:news_app/common/config/constants.dart';
// import 'package:news_app/common/config/constants.dart';
// import 'package:news_app/common/widgets/tab_navigator_routes.dart';
// import 'package:news_app/common/config/constants.dart';
import 'package:news_app/favourites/favourites_screen.dart';
import 'package:news_app/sources/sources_screen.dart';

import '../bloc/navigation/bloc/navigation_bloc.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

// pasidaryt kawd paryskintu kuriam nav bar alemente esi
class _NavBarState extends State<NavBar> {
  // String _currentPage = sourcesRouteName;
  // List<String> pageKeys = [sourcesRouteName, favouritesRouteName];
  // Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
  //   sourcesRouteName: GlobalKey<NavigatorState>(),
  //   favouritesRouteName: GlobalKey<NavigatorState>(),
  // };
  int _selectedIndex = 0;

  // void _selectTab(String tabItem, int index) {
  //   if (tabItem == _currentPage) {
  //     _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
  //   } else {
  //     setState(() {
  //       _currentPage = pageKeys[index];
  //       _selectedIndex = index;
  //     });
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return WillPopScope(
  //     onWillPop: () async {
  //       final isFirstRouteInCurrentTab =
  //           !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
  //       if (isFirstRouteInCurrentTab) {
  //         if (_currentPage != "Page1") {
  //           _selectTab("Page1", 1);

  //           return false;
  //         }
  //       }
  //       // let system handle back button if we're on the first route
  //       return isFirstRouteInCurrentTab;
  //     },
  //     child: Scaffold(
  //       body: Stack(children: <Widget>[
  //         _buildOffstageNavigator(sourcesRouteName),
  //         _buildOffstageNavigator(favouritesRouteName),
  //       ]),
  //       bottomNavigationBar: BottomNavigationBar(
  //         selectedItemColor: Colors.blueAccent,
  //         onTap: (int index) {
  //           _selectTab(pageKeys[index], index);
  //         },
  //         currentIndex: _selectedIndex,
  //         items: const [
  //           BottomNavigationBarItem(
  //             icon: Icon(LineIcons.home),
  //             label: 'Sources',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(LineIcons.heart),
  //             label: 'Favourites',
  //           ),
  //         ],
  //         type: BottomNavigationBarType.fixed,
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildOffstageNavigator(String tabItem) {
  //   return Offstage(
  //     offstage: _currentPage != tabItem,
  //     child: TabNavigator(
  //       navigatorKey: _navigatorKeys[tabItem],
  //       tabItem: tabItem,
  //     ),
  //   );
  // }

  // int _selectedIndex = 0;

  // final PageController _pageController = PageController(initialPage: 0);

  // final tabList = [
  //   ScourcesScreen(),
  //   FavouritesScreen(),
  // ];

  // @override
  // Widget build(BuildContext context) => WillPopScope(
  //       onWillPop: () async {
  //         if (_selectedIndex == 0) {
  //           return false;
  //         }
  //         return true;
  //       },
  //       child: Scaffold(
  //         body: _buildPageView(),
  //         bottomNavigationBar: _buildBottomNavigationBar(context),
  //       ),
  //     );

  // Widget _buildPageView() => PageView(
  //       onPageChanged: (pageIndex) => setState(
  //         () {
  //           _selectedIndex = pageIndex;
  //         },
  //       ),
  //       controller: _pageController,
  //       scrollDirection: Axis.horizontal,
  //       children: tabList,
  //     );
  // Widget _buildBottomNavigationBar(BuildContext context) => BottomNavigationBar(
  //       currentIndex: _selectedIndex,
  //       selectedItemColor: Colors.amber[800],
  //       onTap: (int index) {
  //         _onItemTapped(index);
  //       },
  //       items: const <BottomNavigationBarItem>[
  // BottomNavigationBarItem(
  //   icon: Icon(LineIcons.home),
  //   label: 'Sources',
  // ),
  // BottomNavigationBarItem(
  //   icon: Icon(LineIcons.heart),
  //   label: 'Favourites',
  // ),
  //       ],
  //     );

  // // void _selectTab(String tabItem, int index) {
  // //   if(tabItem == _currentPage ){
  // //     _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
  // //   } else {
  // //     setState(() {
  // //       _currentPage = pageKeys[index];
  // //       _selectedIndex = index;
  // //     });
  // //   }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });

  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => tabList[_selectedIndex],
  //     ),
  //   );
  // }
// }

  @override
  Widget build(BuildContext context) {
    // return BlocListener<NavigationBloc, >(
    //   listener: (context, state) {
    //     if (state is InSources) {
    //       Navigator.of(context).pushNamed(
    //         sourcesRouteName,
    //       );
    //     }
    //     if (state is InFavourites) {
    //       Navigator.of(context).pushNamed(
    //         favouritesRouteName,
    //       );
    //     }
    //   },NavigationState
    //   child:
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Sources',
                  ),
                  GButton(
                    icon: LineIcons.heart,
                    text: 'Favourites',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;

                    if (_selectedIndex == 0) {
                      // Navigator.of(context).pushNamed(
                      //   sourcesRouteName,
                      // );
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => ScourcesScreen(),
                      //   ),
                      // );

                      // BlocListener<NavigationBloc, NavigationState>(
                      //   listener: (context, state) {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(GoToSources(state: state, context: context));
                      //   },
                      // );
                    }

                    if (_selectedIndex == 1) {
                      // Navigator.of(context).pushNamed(
                      //   favouritesRouteName,
                      // );
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => FavouritesScreen(),
                      //   ),
                      // );

                      // BlocListener<NavigationBloc, NavigationState>(
                      //   listener: (context, state) {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(GoToFavourites(state: state, context: context));
                      //   },
                      // );
                      // BlocProvider.of<NavigationBloc>(context)
                      //     .add(GoToFavourites());
                    }
                  });
                },
              ),
            ),
          ),
        );
      },
    );
    // );
  }
}
