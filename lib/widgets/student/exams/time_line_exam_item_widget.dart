// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/student/exams/card_exam_widget.dart';

class TimelineExamItem extends StatelessWidget {
  final String day;
  final String month;
  final String title;
  final IconData icon;
  final bool isLast;

  const TimelineExamItem({
    super.key,
    required this.day,
    required this.month,
    required this.title,
    required this.icon,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // <Day, Month>
        Column(
          children: [
            // The date
            Text(
              day,
              style: AppStyles.styleMedium18().copyWith(color: Colors.indigo),
            ),
            const Gap(2),
            SizedBox(
              width: 30,
              child: Text(
                month,
                style: AppStyles.styleMedium14().copyWith(color: Colors.indigo),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        const Gap(10),
        // Vertical line with <.>
        Column(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.indigo,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 1.5,
              height: 80,
              color: Colors.indigo,
              margin: const EdgeInsets.only(bottom: 24),
            ),
          ],
        ),
        const Gap(14),
        // The card
        CardExam(icon: icon, title: title),
      ],
    );
  }
}
