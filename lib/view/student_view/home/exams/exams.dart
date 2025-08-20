// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/widgets/student/home/calendar/app_bar_component.dart';
import 'package:smartpath/widgets/student/home/grades/drop_field_component.dart';

class Exams extends StatelessWidget {
  Exams({super.key});

  GlobalKey<FormState> examKey = GlobalKey<FormState>();
  TextEditingController exam = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarComponent(data: 'Exam Schedule'.tr),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Gap(150),
                Form(
                  key: examKey,
                  child: DropFieldComponent(
                    title: 'Choose the schedule type'.tr,
                    menuHeight: 175,
                    controller: exam,
                    dropdownMenuEntries: List.generate(
                      3,
                      (index) => DropdownMenuEntry(
                        value: 'type_$index'.tr,
                        label: 'type_$index'.tr,
                      ),
                    ),
                  ),
                ),
                const Gap(125),
                ElevatedButton(
                  onPressed: () {
                    if (examKey.currentState!.validate()) {
                      String examType = '';
                      if ((Get.locale?.languageCode ?? 'en') == 'ar') {
                        switch (exam.text) {
                          case 'إختبار':
                            examType = 'quiz';
                            break;
                          case 'الإمتحان النصفي':
                            examType = 'mid-term';
                            break;
                          case 'الإمتحان النهائي':
                            examType = 'final';
                            break;
                          default:
                        }
                      } else {
                        examType = exam.text;
                      }
                      log(examType);
                      // TODO here for link API
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12.5),
                    ),
                  ),
                  child: Text('Download PDF'.tr),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
