// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/models/student_model/home/grades_model.dart';
import 'package:smartpath/widgets/student/home/calendar/calendar_app_bar_widget.dart';
import 'package:smartpath/widgets/student/home/grades/animated_linear_mark_indicator_widget.dart';
import 'package:smartpath/widgets/student/home/grades/animated_student_mark_circle_widget.dart';

class Grades extends StatelessWidget {
  Grades({super.key});
  final List<GradesModel> grades = Get.arguments['grades'] ?? [];
  final String? message = Get.arguments['message'];
  double avg = 0;

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < grades.length; i++) {
      avg += double.parse(grades[i].result!);
    }
    avg /= 6;
    final List subjects = [
      'math',
      'chemistry',
      'biology',
      'physics',
      'computer',
      'history',
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Curve AppBar
          CalendarAppBarComponent(data: 'grid_item_name_6'.tr),
          // Progress
          SliverToBoxAdapter(
            child: AnimatedStudentMarkCircle(
              mark: (message != null) ? 0 : avg.round(),
            ),
          ),
          // Title
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 10, bottom: 25),
              child: Text(
                'average'.tr,
                textAlign: TextAlign.center,
                style: AppStyles.styleBold22().copyWith(color: Colors.indigo),
              ),
            ),
          ),
          // Subjects
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder:
                    (context, index) => AnimatedLinearMarkIndicator(
                      mark:
                          (message != null)
                              ? 0
                              : int.parse(grades[index].result!),
                      label:
                          (message != null)
                              ? '${subjects[index]}'
                              : grades[index].subjectName,
                      minMark: (message != null) ? 0 : grades[index].minMark!,
                      maxMark: (message != null) ? 100 : grades[index].maxMark!,
                    ),
                separatorBuilder: (context, index) => const Gap(25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
