import 'package:flutter/material.dart';
import 'package:smartpath/main.dart';

class AppColors {
  final Color appBarColor;
  final Color textField;
  final Color buttonText;
  final Color snackBarColor;

  AppColors({
    required this.appBarColor,
    required this.textField,
    required this.buttonText,
    required this.snackBarColor,
  });
}

AppColors getColor() {
  final AppColors studentColors = AppColors(
    appBarColor: const Color.fromRGBO(63, 81, 181, 1).withValues(alpha: 0.3),
    textField: const Color.fromARGB(199, 197, 202, 233),
    buttonText: Colors.indigo,
    snackBarColor: const Color.fromARGB(198, 201, 206, 240),
  );

  final AppColors libColors = AppColors(
    appBarColor: const Color.fromRGBO(121, 85, 72, 1).withValues(alpha: 0.3),
    textField: const Color.fromARGB(199, 231, 218, 205),
    buttonText: const Color.fromRGBO(121, 85, 72, 1),
    snackBarColor: const Color.fromARGB(198, 241, 228, 215),
  );

  final AppColors nurseColors = AppColors(
    appBarColor: const Color.fromRGBO(0, 188, 212, 1).withValues(alpha: 0.3),
    textField: const Color.fromARGB(255, 133, 223, 235),
    buttonText: Colors.blueAccent,
    snackBarColor: const Color.fromARGB(198, 187, 222, 251),
  );

  switch (prefs!.getString('role')!.toLowerCase()) {
    case 'student':
      return studentColors;
    case 'nurse':
      return nurseColors;
    case 'supervisor':
      return libColors;
    case 'librarian':
      return libColors;
    default:
      return libColors;
  }
}
