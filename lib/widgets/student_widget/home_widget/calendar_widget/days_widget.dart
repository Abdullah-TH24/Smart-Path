import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/home_controller/schedule_controller/mark_button_contoller.dart';

class DaysWidget extends StatelessWidget {
  const DaysWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: GetBuilder<MarkButton>(
            init: MarkButton(),
            builder: (controller) {
              ButtonStyle styleButtonSchedule(
                MarkButton controller,
                int index,
              ) {
                return ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12.5),
                  ),
                  shadowColor:
                      (controller.dayIndex == index)
                          ? null
                          : Colors.transparent,
                  backgroundColor:
                      (controller.dayIndex == index)
                          ? Colors.indigo
                          : Colors.transparent,
                  elevation: (controller.dayIndex == index) ? null : 0,
                  side:
                      (controller.dayIndex == index)
                          ? null
                          : const BorderSide(color: Colors.indigo),
                  foregroundColor:
                      (controller.dayIndex == index)
                          ? Colors.indigo[50]
                          : Colors.indigo,
                );
              }

              final List days = [
                'Sun'.tr,
                'Mon'.tr,
                'Tues'.tr,
                'Wed'.tr,
                'Thurs'.tr,
              ];
              return Row(
                children: List.generate(
                  days.length,
                  (index) => Padding(
                    padding:
                        (Get.locale?.languageCode ?? 'en') == 'en'
                            ? EdgeInsets.only(
                              right: (index == days.length - 1) ? 0 : 10.0,
                            )
                            : EdgeInsets.only(
                              left: (index == days.length - 1) ? 0 : 10.0,
                            ),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.makeIndexEqualToValue(index + 1);
                      },
                      style: styleButtonSchedule(controller, index + 1),
                      child: Text(days[index]),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
