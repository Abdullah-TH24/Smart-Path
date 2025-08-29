import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/home_controller/attendance_controller/attendance_controller.dart';

class InfoAboutAbsent extends StatelessWidget {
  final AttendanceController controller;
  const InfoAboutAbsent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: (Get.locale?.languageCode ?? 'en') == 'en'
                        ? const Radius.circular(11.5)
                        : const Radius.circular(0),
                    bottomLeft: (Get.locale?.languageCode ?? 'en') == 'en'
                        ? const Radius.circular(11.5)
                        : const Radius.circular(0),
                    topRight: (Get.locale?.languageCode ?? 'en') == 'en'
                        ? const Radius.circular(0)
                        : const Radius.circular(11.5),
                    bottomRight: (Get.locale?.languageCode ?? 'en') == 'en'
                        ? const Radius.circular(0)
                        : const Radius.circular(11.5),
                  ),
                ),
              ),
              title: Text('absence'.tr),
              trailing: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  radius: 17.5,
                  backgroundColor: Colors.red.withAlpha(100),
                  child: Text(
                    controller.absentDates!.length.toString(),
                    style: TextStyle(color: Colors.red[700]),
                  ),
                ),
              ),
            ),
            const Gap(10),
            // Present
            const Gap(150),
          ],
        ),
      ),
    );
  }
}
