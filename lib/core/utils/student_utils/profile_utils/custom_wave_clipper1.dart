import 'package:flutter/material.dart';

class CustomWaveClipper1 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.4);
    path.cubicTo(
      size.width * 0.35,
      size.height * 1.2,
      size.width * 0.7,
      0,
      size.width,
      size.height * 0.5,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
