import 'package:flutter/material.dart';

class AppTheme {
  
  const AppTheme();

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.deepPurpleAccent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    )
  );
}