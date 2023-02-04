import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    primaryColor: Colors.yellow[700],
    backgroundColor: Colors.amber[400],
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
    labelSmall: TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: TextStyle(
      color: Colors.white,
      fontSize: 25.0,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontSize: 30.0,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 19.0,
      fontWeight: FontWeight.normal,
    ),
  );
}
