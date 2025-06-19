import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/student/home/calendar/calendar_app_bar_widget.dart';
import 'package:smartpath/widgets/student/home/grades/animated_linear_mark_indicator_widget.dart';
import 'package:smartpath/widgets/student/home/grades/animated_student_mark_circle_widget.dart';

class Grades extends StatelessWidget {
  const Grades({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Curve AppBar
          const CalendarAppBarComponent(data: 'Grades'),
          // Progress
          const SliverToBoxAdapter(child: AnimatedStudentMarkCircle(mark: 75)),
          // Title
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 10, bottom: 25),
              child: Text(
                'Average',
                textAlign: TextAlign.center,
                style: AppStyles.styleBold22().copyWith(color: Colors.indigo),
              ),
            ),
          ),
          // Subjects
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: const [
                  AnimatedLinearMarkIndicator(mark: 85, label: "Mathmatic"),
                  Gap(25),
                  AnimatedLinearMarkIndicator(mark: 40, label: "Physics"),
                  Gap(25),
                  AnimatedLinearMarkIndicator(mark: 35, label: "Science"),
                  Gap(25),
                  AnimatedLinearMarkIndicator(mark: 95, label: "Arabic"),
                  Gap(25),
                  AnimatedLinearMarkIndicator(mark: 100, label: "Chemistry"),
                  Gap(25),
                  AnimatedLinearMarkIndicator(mark: 25, label: "English"),
                  Gap(25),
                  AnimatedLinearMarkIndicator(mark: 75, label: "Religion"),
                  Gap(25),
                  AnimatedLinearMarkIndicator(mark: 100, label: "Informatics"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
