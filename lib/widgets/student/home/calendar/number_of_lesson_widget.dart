import 'package:flutter/material.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class NumberOfLessonWidget extends StatelessWidget {
  final int index;
  const NumberOfLessonWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(width: 12.5, color: Colors.indigo[50]!),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.indigo,
        child: Text(
          '${index + 1}',
          style: AppStyles.styleBold16().copyWith(color: Colors.indigo[50]),
        ),
      ),
    );
  }
}
