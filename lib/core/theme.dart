import 'package:flutter/material.dart';

final ThemeData momindTheme = ThemeData(
  primaryColor: const Color(0xFFFFB6C1),
  scaffoldBackgroundColor: const Color(0xFFFFF5F7),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFFFB6C1),
    primary: const Color(0xFFFF8FA3),
  ),
  useMaterial3: true,
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
  ),
);
