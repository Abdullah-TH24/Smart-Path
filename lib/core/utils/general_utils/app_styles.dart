import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle styleRegular24() {
    return const TextStyle(fontSize: 24);
  }

  static TextStyle styleBold24() {
    return const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  }

  static TextStyle styleRegular22() {
    return const TextStyle(fontSize: 22);
  }

  static TextStyle styleBold22() {
    return const TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  }

  static TextStyle styleRegular16() {
    return const TextStyle(fontSize: 16);
  }

  static TextStyle styleBold16() {
    return const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  }
}
