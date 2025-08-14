// ignore_for_file: must_be_immutable

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/widgets/student/home/calendar/app_bar_component.dart';

class Absences extends StatefulWidget {
  const Absences({super.key});

  @override
  State<Absences> createState() => _AbsencesState();
}

class _AbsencesState extends State<Absences> {
  final List<DateTime> absentDays = [
    DateTime(2025, 8, 2),
    DateTime(2025, 8, 5),
    DateTime(2025, 8, 10),
  ];

  List<DateTime?> _selectedDate = [DateTime.now()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarComponent(data: 'grid_item_name_5'.tr),
          // Calender
          SliverToBoxAdapter(
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                monthBorderRadius: BorderRadius.circular(12.5),
                yearBorderRadius: BorderRadius.circular(12.5),
                controlsTextStyle: const TextStyle(color: Colors.black),
                lastMonthIcon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 15,
                ),
                nextMonthIcon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 15,
                ),
                calendarType: CalendarDatePicker2Type.single, // يوم واحد فقط
                selectedDayHighlightColor: Colors.indigo, // لون اليوم المحدد
                dayBuilder: ({
                  required date,
                  decoration,
                  isDisabled,
                  isSelected,
                  isToday,
                  textStyle,
                }) {
                  bool isAbsent = absentDays.any(
                    (absentDay) =>
                        absentDay.year == date.year &&
                        absentDay.month == date.month &&
                        absentDay.day == date.day,
                  );
                  return Container(
                    decoration: BoxDecoration(
                      color:
                          isSelected!
                              ? Colors.indigo
                              : isToday!
                              ? Colors.indigo[100]
                              : isAbsent
                              ? Colors.red
                              : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${date.day}',
                      style: TextStyle(
                        color:
                            (isSelected || isAbsent)
                                ? Colors.white
                                : Colors.black,
                        fontWeight:
                            isAbsent ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  );
                },
              ),
              value: _selectedDate,
              onValueChanged: (dates) {
                _selectedDate = dates;
                setState(() {});
              },
            ),
          ),
          // Absent & Present Numbers
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Absent
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12.5),
                      side: const BorderSide(width: 1, color: Colors.red),
                    ),
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      height: double.infinity,
                      width: 25,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(11.5),
                          bottomLeft: Radius.circular(11.5),
                        ),
                      ),
                    ),
                    title: const Text('Absent'),
                    trailing: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: CircleAvatar(
                        radius: 17.5,
                        backgroundColor: Colors.red.withAlpha(100),
                        child: Text(
                          '3',
                          style: TextStyle(color: Colors.red[700]),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  // Present
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12.5),
                      side: const BorderSide(width: 1, color: Colors.green),
                    ),
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      height: double.infinity,
                      width: 25,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(11.5),
                          bottomLeft: Radius.circular(11.5),
                        ),
                      ),
                    ),
                    title: const Text('Present'),
                    trailing: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: CircleAvatar(
                        radius: 17.5,
                        backgroundColor: Colors.green.withAlpha(100),
                        child: Text(
                          '24',
                          style: TextStyle(color: Colors.green[700]),
                        ),
                      ),
                    ),
                  ),
                  const Gap(100),
                ],
              ),
            ),
          ),
          // <Upload Justification> Button
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed:
                    // null,
                    () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12.5),
                  ),
                  fixedSize: Size(Get.width - 40, 50),
                ),
                child: const Text('Upload Justification'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
