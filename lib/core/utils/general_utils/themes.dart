import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.indigo[50],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
    ),
    appBarTheme: AppBarTheme(backgroundColor: Colors.indigo[50], elevation: 0),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(backgroundColor: Colors.indigo[300]),
    ),
    textTheme: GoogleFonts.montserratTextTheme(),
  );

  ThemeData dark = ThemeData(
    scaffoldBackgroundColor: const Color(0xff0f0b3e),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff6e33f7)),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff0f0b3e),
      elevation: 0,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(backgroundColor: Colors.indigo[500]),
    ),
    textTheme: GoogleFonts.montserratTextTheme(Typography.whiteMountainView),
  );
}
