// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/core/utils/general_utils/app_styles.dart';
import 'package:smartpath/widgets/student/home/calendar/lessons.dart';
import 'package:smartpath/widgets/student/home/calendar/total_attendance.dart';
import 'package:smartpath/widgets/student/profile/upper_waves.dart';

class Calendar extends StatelessWidget {
  Calendar({super.key});

  List<DateTime?> _dates = [DateTime.now()];
  LocalizationController locale = Get.find();
  final List<DateTime> holidays = [
    DateTime(2025, 6, 1),
    DateTime(2025, 6, 15),
    DateTime(2025, 6, 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Curve AppBar
          SliverAppBar(
            pinned: true,
            expandedHeight: 80,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                locale.initailLang == const Locale('en') ||
                        locale.initailLang == Get.deviceLocale
                    ? LucideIcons.chevronLeft
                    : LucideIcons.chevronRight,
                color: Colors.indigo,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: const UpperWaves(),
              titlePadding: const EdgeInsets.only(
                top: 8,
                left: 16,
                bottom: 8,
                right: 16,
              ),
              centerTitle: true,
              title: Text(
                'Calendar',
                style: AppStyles.styleMedium14().copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          // Calendar
          SliverToBoxAdapter(
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.single,
                dayBuilder: ({
                  required DateTime date,
                  BoxDecoration? decoration,
                  bool? isDisabled,
                  bool? isSelected,
                  bool? isToday,
                  TextStyle? textStyle,
                }) {
                  final isHoliday = holidays.any(
                    (holiday) =>
                        holiday.year == date.year &&
                        holiday.month == date.month &&
                        holiday.day == date.day,
                  );
                  Color backgroundColor = Colors.transparent;
                  Color textColor = Colors.black;
                  if (isSelected == true) {
                    backgroundColor = Colors.indigo; // لون اليوم المحدد
                    textColor = Colors.white;
                  } else if (isHoliday) {
                    backgroundColor = Colors.green;
                    textColor = Colors.white;
                  } else if (isToday == true) {
                    backgroundColor = Colors.grey.shade300;
                    textColor = Colors.black;
                  }
                  return Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${date.day}',
                      style: TextStyle(
                        color: textColor,
                        fontWeight:
                            isToday == true
                                ? FontWeight.bold
                                : FontWeight.normal,
                      ),
                    ),
                  );
                },
              ),
              value: _dates,
              onValueChanged: (dates) {
                _dates = dates;
              },
            ),
          ),
          // Lessons
          const Lessons(isHoliday: false),
          // Total Attendance
          const TotalAttendance(),
        ],
      ),
    );
  }
}
