import 'package:flutter/material.dart';

abstract class AppStyles {
  //Regular

  static TextStyle styleRegular12() {
    return const TextStyle(fontSize: 12);
  }

  static TextStyle styleRegular14() {
    return const TextStyle(fontSize: 14);
  }

  static TextStyle styleRegular16() {
    return const TextStyle(fontSize: 16);
  }

  static TextStyle styleRegular22() {
    return const TextStyle(fontSize: 22);
  }

  static TextStyle styleRegular24() {
    return const TextStyle(fontSize: 24);
  }

  //meduim
  static TextStyle styleMedium14() {
    return const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  }

  static TextStyle styleMedium20() {
    return const TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
  }

  static TextStyle styleMedium24() {
    return const TextStyle(fontSize: 24, fontWeight: FontWeight.w500);
  }

  //Bold

  static TextStyle styleBold16() {
    return const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  }

  static TextStyle styleBold22() {
    return const TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  }

  static TextStyle styleBold24() {
    return const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  }
}
