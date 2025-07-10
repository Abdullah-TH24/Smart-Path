// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/home/grades/grades_controller.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/widgets/login/button_component.dart';
import 'package:smartpath/widgets/login/title_with_desc_component.dart';
import 'package:smartpath/widgets/student/home/grades/drop_field_component.dart';

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
                        '${DateTime.now().year - (index / 2).toInt()} - ${index.isEven ? 'First' : 'Second'}',
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
                    value: 'type_$index'.tr,
                    label: 'type_$index'.tr,
                  ),
                ),
              ),
              const Gap(75),
              // <Next> Button
              GetBuilder<GradesController>(
                builder: (controller) {
                  return ButtonComponent(
                    onPressed:
                        (controller.isLoading)
                            ? null
                            : () async {
                              if (filter.currentState!.validate()) {
                                // String typeText = '';
                                // if (year.text.split(' ')[2] == 'First') {
                                //   if (type.text == 'Final') {
                                //     typeText = 'mid-term';
                                //   } else {
                                //     typeText = 'quizz';
                                //   }
                                // } else if (year.text.split(' ')[2] == 'Second') {
                                //   if (type.text == 'Final') {
                                //     typeText = 'final';
                                //   } else {
                                //     typeText = 'quizz';
                                //   }
                                // }
                                await controller.getGrades(
                                  prefs!.getString('token')!,
                                  int.parse(year.text.split(' ')[0]),
                                  year.text.split(' ')[2],
                                  type.text.toLowerCase(),
                                );
                                if (controller.errorMessage != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(controller.errorMessage!),
                                    ),
                                  );
                                  return;
                                }
                                if (controller.grades != null ||
                                    controller.noResultsMessages != null) {
                                  Get.offNamed(
                                    AppRoutes.studentGrades,
                                    arguments: {
                                      'grades': controller.grades,
                                      'message': controller.noResultsMessages,
                                    },
                                  );
                                  return;
                                }
                              }
                            },
                    child:
                        (controller.isLoading)
                            ? SpinKitFadingGrid(
                              color: Colors.indigo[900],
                              size: 30,
                            )
                            : Text(
                              'button_text'.tr,
                              style: AppStyles.styleRegular22().copyWith(
                                color: Colors.white,
                              ),
                            ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
