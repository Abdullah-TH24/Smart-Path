import 'dart:math';
import 'package:flutter/material.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AnimatedStudentMarkCircle extends StatefulWidget {
  final int mark;
  const AnimatedStudentMarkCircle({super.key, required this.mark});

  @override
  State<AnimatedStudentMarkCircle> createState() =>
      _AnimatedStudentMarkCircleState();
}

class _AnimatedStudentMarkCircleState extends State<AnimatedStudentMarkCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0,
      end: widget.mark.toDouble(),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final int currentMark = _animation.value.round();
          final bool isLowMark = currentMark < 40;
          return CircularStepProgressIndicator(
            totalSteps: 100,
            currentStep: currentMark,
            stepSize: 20,
            selectedColor: isLowMark ? Colors.red[900] : Colors.indigo,
            unselectedColor: Colors.blueGrey.shade400,
            padding: 0,
            width: 150,
            height: 150,
            startingAngle: 0,
            arcSize: 2 * pi,
            child: Center(
              child: Text(
                '$currentMark%',
                style: AppStyles.styleBold24().copyWith(
                  color: isLowMark ? Colors.red[900] : Colors.indigo,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
