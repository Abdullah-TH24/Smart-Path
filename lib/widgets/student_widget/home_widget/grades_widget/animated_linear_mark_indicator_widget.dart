import 'package:flutter/material.dart';
import 'package:smartpath/widgets/student_widget/home_widget/grades_widget/item_animated_linear_mark_indicator_widget.dart';

class AnimatedLinearMarkIndicator extends StatefulWidget {
  final int mark;
  final int minMark;
  final int maxMark;
  final Duration duration;
  final Color? color;
  final String? label;
  const AnimatedLinearMarkIndicator({
    super.key,
    required this.mark,
    this.duration = const Duration(seconds: 2),
    this.color,
    required this.label,
    required this.minMark,
    required this.maxMark,
  });

  @override
  State<AnimatedLinearMarkIndicator> createState() =>
      _AnimatedLinearMarkIndicatorState();
}

class _AnimatedLinearMarkIndicatorState
    extends State<AnimatedLinearMarkIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int get mark => widget.mark.clamp(0, 100);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(
      begin: 0,
      end: mark.toDouble(),
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
    return ItemAnimatedLinearMarkIndicator(
      widget: widget,
      animation: _animation,
      maxMark: widget.maxMark,
      minMark: widget.minMark,
    );
  }
}
