// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/widgets/student/home/calendar/calendar_app_bar_widget.dart';
import 'package:smartpath/widgets/student/home/calendar/days_widget.dart';
import 'package:smartpath/widgets/student/home/calendar/lessons_widget.dart';

class Calendar extends StatelessWidget {
  Calendar({super.key});

  LocalizationController locale = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: CustomScrollView(
        slivers: [
          // Curve AppBar
          CalendarAppBarComponent(data: 'schedule_title_page'.tr),
          // Days
          const DaysWidget(),
          // Lessons
          const Lessons(),
        ],
      ),
    );
  }
}
