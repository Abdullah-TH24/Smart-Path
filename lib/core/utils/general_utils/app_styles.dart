import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle styleRegular24(context, {required Color? color}) {
    return TextStyle(fontSize: 24, color: color);
  }

  static TextStyle styleBold24(context, {required Color? color}) {
    return TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle styleRegular22(context, {required Color? color}) {
    return TextStyle(fontSize: 22, color: color);
  }

  static TextStyle styleBold22(context, {required Color? color}) {
    return TextStyle(fontSize: 22, color: color, fontWeight: FontWeight.bold);
  }

  static TextStyle styleRegular16(context, {required Color? color}) {
    return TextStyle(fontSize: 16, color: color);
  }

  static TextStyle styleBold16(context, {required Color? color}) {
    return TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color);
  }
}
