import 'package:flutter/material.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/student_widget/home_widget/grades_widget/animated_linear_mark_indicator_widget.dart';

class ItemAnimatedLinearMarkIndicator extends StatelessWidget {
  final AnimatedLinearMarkIndicator widget;
  final Animation<double> _animation;
  final int minMark;
  final int maxMark;
  const ItemAnimatedLinearMarkIndicator({
    super.key,
    required this.widget,
    required Animation<double> animation,
    required this.minMark,
    required this.maxMark,
  }) : _animation = animation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final int currentMark = _animation.value.round();
          final Color progressColor =
              (widget.color != null)
                  ? widget.color!
                  : (currentMark < minMark)
                  ? Colors.red[900]!
                  : Colors.indigo;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Subject name with Avarage
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.label!, style: AppStyles.styleMedium14()),
                    Text(
                      '$currentMark/$maxMark',
                      style: AppStyles.styleMedium14().copyWith(
                        color: progressColor,
                      ),
                    ),
                  ],
                ),
              ),
              // Linear widget
              Container(
                height: 20,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      widthFactor: currentMark / maxMark,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              progressColor.withAlpha(100),
                              progressColor,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
