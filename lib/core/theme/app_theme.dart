import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.w300),
      titleMedium: TextStyle(fontSize: 18, color: Colors.grey),
    ),
  );
}
