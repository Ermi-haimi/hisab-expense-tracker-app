import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFFF9FAFB),
    appBarTheme: AppBarThemeData(
      backgroundColor: Colors.white,
    ),
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
      titleMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight(600),
        color: Colors.black,
      ),
      labelMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight(500),
        color: Colors.black,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white38,
      indicatorColor: Color.fromRGBO(79, 57, 246, 0.2),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.white,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF0C1B29),
    appBarTheme: AppBarThemeData(
      backgroundColor: Color(0xFF0C1B29),
    ),
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
      titleMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight(600),
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight(500),
        color: Colors.white,
      ),
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.black26,
      indicatorColor: Color.fromRGBO(162, 149, 236, 0.2),
    ),

    chipTheme: ChipThemeData(
      backgroundColor: Color(0xff495057),
      selectedColor: Color(0xff6c757d),
    ),
  );
}
