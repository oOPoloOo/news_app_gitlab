// ignore_for_file: use_key_in_widget_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/common/bloc/navigation/bloc/navigation_bloc.dart';
import 'package:news_app/common/config/constants.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = splashRouteName;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late NavigationBloc _navigationBloc;

  @override
  void initState() {
    _navigationBloc = BlocProvider.of<NavigationBloc>(context);
    _navigationBloc.goFromSplash(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.onPrimary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('bestNews').tr(),
              const SizedBox(height: 16),
              SpinKitFoldingCube(
                color: Theme.of(context).colorScheme.background,
                duration: const Duration(milliseconds: 1000),
              )
            ],
          ),
        ),
      ),
    );
  }
}
