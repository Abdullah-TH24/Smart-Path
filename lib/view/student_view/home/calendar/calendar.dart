// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/controller/student_controller/home/calendar/schedule_controller.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/widgets/student/home/calendar/calendar_app_bar_widget.dart';
import 'package:smartpath/widgets/student/home/calendar/days_widget.dart';
import 'package:smartpath/widgets/student/home/calendar/lessons_widget.dart';

class Calendar extends StatelessWidget {
  Calendar({super.key});

  LocalizationController locale = Get.find();
  ScheduleController controller = Get.put(ScheduleController());

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
          GetBuilder<ScheduleController>(
            builder: (controller) {
              if (controller.isLoading) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: Get.height - 120,
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.indigo),
                    ),
                  ),
                );
              }
              if (controller.errorMessage != null) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: Get.height - 120,
                    child: Center(child: Image.asset(AppAssets.noInternet)),
                  ),
                );
              }
              return const Lessons();
            },
          ),
        ],
      ),
    );
  }
}
