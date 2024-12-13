import 'package:flutter/material.dart';

class ThemeManager {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Primary color
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    // Background and text colors
    scaffoldBackgroundColor: Colors.white, // White background for light mode
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      onBackground: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black, // Text color in light mode
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.black, // Secondary text color in light mode
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: Colors.black54, // Subtle text color for light mode
      ),
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
      shadowColor: Colors.grey,
      elevation: 4,
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    // Primary color
    primaryColor: Colors.grey[850],
    appBarTheme: AppBarTheme(
      color: Colors.grey[900],
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    // Background and text colors
    scaffoldBackgroundColor: Colors.black, // Dark background for dark mode
    colorScheme: ColorScheme.dark(
      background: Colors.black,
      onBackground: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white, // Text color in dark mode
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.white, // Secondary text color in dark mode
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: Colors.white70, // Subtle text color for dark mode
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.grey[850],
      shadowColor: Colors.black,
      elevation: 4,
    ),
  );
}
