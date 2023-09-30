import 'package:flutter/material.dart';

final mainTheme = ThemeData(
  primarySwatch: const Color.fromRGBO(96, 125, 139, 1) as MaterialColor,
  scaffoldBackgroundColor: const Color.fromARGB(255, 9, 37, 66),
  dividerTheme: const DividerThemeData(color: Colors.blueGrey),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white60,
      fontWeight: FontWeight.w600,
      fontSize: 23,
    ),
    bodySmall: TextStyle(
      color: Colors.white38,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
  ),
);
