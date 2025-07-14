// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/home/grades/grades_controller.dart';
import 'package:smartpath/widgets/login/title_with_desc_component.dart';
import 'package:smartpath/widgets/student/home/grades/drop_field_component.dart';
import 'package:smartpath/widgets/student/home/grades/filter_page_button_widget.dart';

class ContentFilterPage extends StatelessWidget {
  ContentFilterPage({
    super.key,
    required this.filter,
    required this.studentName,
    required this.year,
    required this.type,
    required this.years,
  });
  final int years;
  final GlobalKey<FormState> filter;
  final String studentName;
  final TextEditingController year;
  final TextEditingController type;

  GradesController controller = Get.put(GradesController());

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Form(
        key: filter,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const Gap(15),
              // Hi with description
              TitleWithDesc(
                title: '${'hi'.tr} $studentName',
                desc: 'filter_desc'.tr,
              ),
              const Gap(85),
              // First filter field <title & field>
              DropFieldComponent(
                title: 'title_field_1'.tr,
                menuHeight: 168,
                controller: year,
                dropdownMenuEntries: List.generate(
                  years * 2,
                  (index) => DropdownMenuEntry(
                    value:
                        '${DateTime.now().year - (index / 2).toInt()} - ${index.isEven ? 'First' : 'Second'}',
                    label:
                        '${DateTime.now().year - (index / 2).toInt()} - ${index.isEven ? 'First'.tr : 'Second'.tr}',
                  ),
                ),
              ),
              const Gap(25),
              // Second filter field <title & field>
              DropFieldComponent(
                title: 'title_field_2'.tr,
                menuHeight: 112,
                controller: type,
                dropdownMenuEntries: List.generate(
                  2,
                  (index) => DropdownMenuEntry(
                    value: 'type_$index',
                    label: 'type_$index'.tr,
                  ),
                ),
              ),
              const Gap(75),
              // <Next> Button
              FilterPageButtonWidget(filter: filter, year: year, type: type),
            ],
          ),
        ),
      ),
    );
  }
}
