import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    primaryColor: Colors.yellow[700],
    //backgroundColor: Colors.amber[400],
    backgroundColor: Colors.black,
    textTheme: textTheme(),
  );
}

textTheme() {
  return const TextTheme(
    titleLarge: TextStyle(
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
    labelSmall: TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
    ),
  );
}
