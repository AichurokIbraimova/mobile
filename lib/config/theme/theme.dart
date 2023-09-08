import 'package:flutter/material.dart';

var theme = ThemeData(
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.20,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.20,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.w500,
      height: 1.20,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
