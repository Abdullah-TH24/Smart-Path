import 'package:flutter/material.dart';

class CustomWaveClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.7);
    path.cubicTo(
      size.width * 0.3,
      size.height * 0.01,
      size.width * 0.55,
      size.height * 1.25,
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
