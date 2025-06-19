// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/controller/student_controller/home/calendar/holiday_controller.dart';
import 'package:smartpath/widgets/student/home/calendar/calendar_app_bar_widget.dart';
import 'package:smartpath/widgets/student/home/calendar/calendar_widget.dart';
import 'package:smartpath/widgets/student/home/calendar/lessons_widget.dart';

class Calendar extends StatelessWidget {
  Calendar({super.key});

  final List<DateTime?> _dates = [DateTime.now()];
  LocalizationController locale = Get.find();
  Holiday holiday = Get.put(Holiday());
  List<DateTime> holidays = [
    DateTime(2025, 6, 1),
    DateTime(2025, 6, 15),
    DateTime(2025, 6, 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: CustomScrollView(
        slivers: [
          // Curve AppBar
          CalendarAppBarComponent(data: 'calendar_title_page'.tr),
          // Calendar
          SliverToBoxAdapter(
            child: calendarWidget(
              datesList: _dates,
              holidays: holidays,
              holiday: holiday,
            ),
          ),
          // Lessons
          GetBuilder<Holiday>(
            builder: (controller) {
              return Lessons(isHoliday: controller.myHoliday);
            },
          ),
        ],
      ),
    );
  }
}


// Total Attendance TODO move this feature to parent app
      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.all(25),
      //   decoration: BoxDecoration(
      //     color: const Color.fromARGB(255, 200, 204, 233),
      //     borderRadius: BorderRadius.circular(50),
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       const Text('Total attendance'),
      //       Row(
      //         children: List.generate(
      //           7,
      //           (index) => Container(
      //             height: 10,
      //             width: 15,
      //             margin: const EdgeInsets.only(left: 2.5),
      //             decoration: BoxDecoration(
      //               color: (index != 6) ? Colors.green[600] : Colors.red[600],
      //               borderRadius: BorderRadius.circular(2.5),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
