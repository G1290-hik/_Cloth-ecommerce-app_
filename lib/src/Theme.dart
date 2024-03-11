// ignore_for_file: file_names

import 'package:flutter/material.dart';

// Define your custom theme
ThemeData customTheme = ThemeData(
  cardColor: Colors.white,
  primaryColor: const Color(0xFFFAB4FF),
  hintColor: Colors.green,
  textTheme: const TextTheme(
    headlineMedium: TextStyle(color: Colors.black),
  ), // Set your accent color
);
// Define your custom dark theme
final ThemeData customDarkTheme = ThemeData.dark().copyWith(
  primaryColor: const Color.fromRGBO(3, 27, 37, 0.698),
  textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color.fromARGB(255, 247, 234, 234))),
  hintColor: const Color.fromARGB(255, 255, 242, 0),
);
