// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/home/calendar/mark_button_contoller.dart';
import 'package:smartpath/controller/student_controller/home/calendar/schedule_controller.dart';
import 'package:smartpath/core/localization/subjects_translate.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/student/home/calendar/number_of_lesson_widget.dart';

class Lessons extends StatelessWidget {
  const Lessons({super.key});

  @override
  Widget build(BuildContext context) {
    Map indexes = {};
    final Map<int, String> times = {
      1: '08:30${'AM'.tr} - 09:15${'AM'.tr}',
      2: '09:15${'AM'.tr} - 10:00${'AM'.tr}',
      3: '10:15${'AM'.tr} - 11:00${'AM'.tr}',
      4: '11:00${'AM'.tr} - 11:45${'AM'.tr}',
      5: '12:00${'PM'.tr} - 12:45${'PM'.tr}',
      6: '12:45${'PM'.tr} - 13:30${'PM'.tr}',
      7: '13:30${'PM'.tr} - 14:15${'PM'.tr}',
    };
    return SliverToBoxAdapter(
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(7, (index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Stack(
              children: [
                // Subject
                Positioned.fill(
                  left: (Get.locale?.languageCode ?? 'en') == 'en' ? 50 : 0,
                  right: (Get.locale?.languageCode ?? 'en') == 'en' ? 0 : 50,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 10,
                    ),
                    width: Get.width - 120,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(200, 200, 204, 233),
                      borderRadius: BorderRadius.circular(12.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GetBuilder<ScheduleController>(
                          init: ScheduleController(),
                          builder: (controller) {
                            return GetBuilder<MarkButton>(
                              init: MarkButton(),
                              builder: (dayController) {
                                if (index == 0) {
                                  indexes = {};
                                  main:
                                  for (
                                    var i = 0;
                                    i < controller.schedule!.length;
                                    i++
                                  ) {
                                    if (indexes.length > 7) break main;
                                    if (dayController.dayIndex == 1) {
                                      if (controller.schedule![i].day ==
                                          'sunday') {
                                        indexes.addAll({
                                          int.parse(
                                            controller.schedule![i].session!,
                                          ): i,
                                        });
                                      }
                                    } else if (dayController.dayIndex == 2) {
                                      if (controller.schedule![i].day ==
                                          'monday') {
                                        indexes.addAll({
                                          int.parse(
                                            controller.schedule![i].session!,
                                          ): i,
                                        });
                                      }
                                    } else if (dayController.dayIndex == 3) {
                                      if (controller.schedule![i].day ==
                                          'tuesday') {
                                        indexes.addAll({
                                          int.parse(
                                            controller.schedule![i].session!,
                                          ): i,
                                        });
                                      }
                                    } else if (dayController.dayIndex == 4) {
                                      if (controller.schedule![i].day ==
                                          'wednesday') {
                                        indexes.addAll({
                                          int.parse(
                                            controller.schedule![i].session!,
                                          ): i,
                                        });
                                      }
                                    } else if (dayController.dayIndex == 5) {
                                      if (controller.schedule![i].day ==
                                          'thursday') {
                                        indexes.addAll({
                                          int.parse(
                                            controller.schedule![i].session!,
                                          ): i,
                                        });
                                      }
                                    }
                                  }
                                }
                                return Text(
                                  SubjectTranslator.translate(
                                    controller
                                        .schedule![indexes[index + 1]]
                                        .subject!,
                                  ),
                                  style: AppStyles.styleBold22().copyWith(
                                    fontSize: 20,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        const Gap(10),
                        Text(
                          times[index + 1]!,
                          style: AppStyles.styleBold16().copyWith(
                            color: Colors.black54
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Number of lesson
                NumberOfLessonWidget(index: index),
              ],
            ),
          );
        }),
      ),
    );
  }
}
