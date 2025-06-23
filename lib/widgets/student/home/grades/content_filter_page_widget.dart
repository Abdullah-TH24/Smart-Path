import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/login/button_component.dart';
import 'package:smartpath/widgets/login/title_with_desc_component.dart';
import 'package:smartpath/widgets/student/home/grades/drop_field_component.dart';

class ContentFilterPage extends StatelessWidget {
  const ContentFilterPage({
    super.key,
    required this.filter,
    required this.studentName,
    required this.year,
    required this.type,
  });

  final GlobalKey<FormState> filter;
  final String studentName;
  final TextEditingController year;
  final TextEditingController type;

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
                controller: year,
                dropdownMenuEntries: List.generate(
                  4,
                  (index) => DropdownMenuEntry(
                    value: '${2025 - index}',
                    label: '${2025 - index}',
                  ),
                ),
              ),
              const Gap(25),
              // Second filter field <title & field>
              DropFieldComponent(
                title: 'title_field_2'.tr,
                controller: type,
                dropdownMenuEntries: List.generate(
                  3,
                  (index) => DropdownMenuEntry(
                    value: 'type_$index'.tr,
                    label: 'type_$index'.tr,
                  ),
                ),
              ),
              const Gap(75),
              // <Next> Button
              ButtonComponent(
                onPressed: () {
                  if (filter.currentState!.validate()) {
                    Get.offNamed(AppRoutes.studentGrades);
                  }
                },
                child: Text(
                  'button_text'.tr,
                  style: AppStyles.styleRegular22().copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
