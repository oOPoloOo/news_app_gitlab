// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import '../bloc/navigation/bloc/navigation_bloc.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

// pasidaryt kawd paryskintu kuriam nav bar alemente esi
class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

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
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
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
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;

                    if (_selectedIndex == 0) {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(GoToSources(state: state, context: context));
                    }

                    if (_selectedIndex == 1) {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(GoToFavourites(state: state, context: context));
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
