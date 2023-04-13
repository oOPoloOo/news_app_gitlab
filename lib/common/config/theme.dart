// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: 'Avenir',
    textTheme: textTheme(),
    colorScheme: colorScheme,
  );
}

final ColorScheme colorScheme = ColorScheme(
  primary: Color(0xFF424242),
  secondary: Color(0xFFFFFFFF),
  background: Colors.black,
  surface: Color(0xFFFFFFFF),
  onBackground: Colors.transparent,
  error: Colors.redAccent,
  onError: Colors.redAccent,
  onPrimary: Colors.grey,
  onSecondary: Color(0xFF322942),
  onSurface: Color(0xFF241E30),
  brightness: Brightness.light,
  primaryContainer: Colors.grey[400],
);

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
