import 'package:flutter/material.dart';

class AppTheme {
  static const Color deepBlue = Color(0xFF0D47A1); 

  static final ThemeData lightTheme = ThemeData(
    primaryColor: deepBlue,
    appBarTheme: AppBarTheme(
      backgroundColor: deepBlue,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: deepBlue,
    ),
    cardTheme: CardTheme(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: deepBlue,
    appBarTheme: AppBarTheme(
      backgroundColor: deepBlue,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: deepBlue,
    ),
    cardTheme: CardTheme(
      color: Colors.grey[900],
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
