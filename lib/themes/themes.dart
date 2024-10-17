import 'package:flutter/material.dart';

// light mode
ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade200,
    primary: Colors.white,
    secondary: Colors.grey.shade200,
    inversePrimary: Colors.grey.shade900,
    tertiary: Colors.white,
  ),
  useMaterial3: true,
);

// dark mode
ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.black45,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    inversePrimary: Colors.grey.shade200,
    tertiary: Colors.white,
  ),
  useMaterial3: true,
);
