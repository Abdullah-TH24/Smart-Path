import 'package:flutter/material.dart';
import 'package:smartpath/core/utils/student_utils/profile_utils/custom_wave_clipper.dart';
import 'package:smartpath/core/utils/student_utils/profile_utils/custom_wave_clipper1.dart';

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
