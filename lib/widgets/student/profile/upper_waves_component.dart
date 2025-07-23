// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:smartpath/core/utils/student_utils/profile_utils/custom_wave_clipper.dart';
import 'package:smartpath/core/utils/student_utils/profile_utils/custom_wave_clipper1.dart';

class UpperWaves extends StatelessWidget {
  UpperWaves({super.key, this.color});
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomWaveClipper(),
          child: Container(
            height: 90,
            color: color ?? Colors.indigo.withValues(alpha: 0.2),
          ),
        ),
        ClipPath(
          clipper: CustomWaveClipper1(),
          child: Container(
            height: 90,
            color: color ?? Colors.indigo.withValues(alpha: 0.2),
          ),
        ),
      ],
    );
  }
}
