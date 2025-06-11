import 'package:flutter/material.dart';

class UpperWaves extends StatelessWidget {
  const UpperWaves({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomWaveClipper(),
          child: Container(
            height: 90,
            color: Colors.indigo.withValues(alpha: 0.2),
          ),
        ),
        ClipPath(
          clipper: CustomWaveClipper1(),
          child: Container(
            height: 90,
            color: Colors.indigo.withValues(alpha: 0.2),
          ),
        ),
      ],
    );
  }
}

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
