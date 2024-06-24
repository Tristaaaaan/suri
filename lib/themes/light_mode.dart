import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: const Color(0xff725959),
    secondary: const Color(0xff665252).withOpacity(0.5),
    tertiary: const Color.fromARGB(255, 180, 180, 180).withOpacity(0.2),
    inversePrimary: Colors.grey.shade900,
    tertiaryContainer: const Color(0xff939cc4),
  ),
);
