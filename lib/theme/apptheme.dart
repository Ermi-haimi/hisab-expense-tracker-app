import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFFF9FAFB),
    cardTheme: CardThemeData(
      color: Colors.white,
    ),
    textTheme: TextTheme(
      labelLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight(600),
        // color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight(300),
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight(600),
        color: Colors.black,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white38,
      indicatorColor: Color.fromRGBO(79, 57, 246, 0.2),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF0C1B29),
    cardTheme: CardThemeData(
      color: Color(0xff232323),
    ),

    textTheme: TextTheme(
      labelLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight(600),
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight(300),
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight(600),
        color: Colors.white,
      ),
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.black26,
      indicatorColor: Color.fromRGBO(162, 149, 236, 0.2),
    ),
  );
}
