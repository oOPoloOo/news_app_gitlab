// ignore_for_file: prefer_const_constructors, prefer_final_fields, no_logic_in_create_state, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import '../bloc/navigation/bloc/navigation_bloc.dart';

class NavBar extends StatefulWidget {
  final int? inheritedIndex;
  const NavBar({this.inheritedIndex});

  @override
  State<NavBar> createState() => _NavBarState(
        inheritedIndex: inheritedIndex,
      );
}

class _NavBarState extends State<NavBar> {
  final int? inheritedIndex;
  late int _selectedIndex;

  _NavBarState({this.inheritedIndex});
  // TODO : Paziuret ar iseina be inheritedIndex padaryt
  @override
  void initState() {
    inheritedIndex == null
        ? _selectedIndex = 0
        : _selectedIndex = inheritedIndex!;
    super.initState();
  }

// TODO : use colors from class
  @override
  Widget build(BuildContext context) {
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
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              // TODO : remove gnav
              child: GNav(
                rippleColor: Colors.grey,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,
                tabActiveBorder: Border.all(color: Colors.black),
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
                // TODO : Nenaudojant index check turetu sauvaikciot i screen
                //TODO : Use BottomNavigationBarWidget
                //TODO :Navigacijai naudoti PageController
                // TODO : fix all alerts from console
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;

                    if (_selectedIndex == 0) {
                      BlocProvider.of<NavigationBloc>(context)
                          .goToSources(context, state);
                    }

                    if (_selectedIndex == 1) {
                      BlocProvider.of<NavigationBloc>(context)
                          .goToFavourites(context, state, _selectedIndex);
                    }
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
