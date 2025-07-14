import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/home/grades/grades_controller.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/widgets/login/button_component.dart';

class FilterPageButtonWidget extends StatelessWidget {
  const FilterPageButtonWidget({
    super.key,
    required this.filter,
    required this.year,
    required this.type,
  });

  final GlobalKey<FormState> filter;
  final TextEditingController year;
  final TextEditingController type;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GradesController>(
      builder: (controller) {
        return ButtonComponent(
          onPressed:
              (controller.isLoading)
                  ? null
                  : () async {
                    if (filter.currentState!.validate()) {
                      String semester = year.text.split(' ')[2];
                      String typeStr = type.text;
                      if ((Get.locale?.languageCode ?? 'en') == 'ar') {
                        switch ('${year.text.split(' ')[2]} ${year.text.split(' ')[3]}') {
                          case 'الفصل الأول':
                            semester = 'First';
                            break;
                          case 'الفصل الثاني':
                            semester = 'Second';
                            break;
                          default:
                        }
                        switch ((type.text.split(' ').length > 1)
                            ? '${type.text.split(' ')[0]} ${type.text.split(' ')[1]}'
                            : type.text.split(' ')[0]) {
                          case 'الإمتحان النهائي':
                            typeStr = 'Final';
                            break;
                          case 'إختبار':
                            typeStr = 'quizz';
                          default:
                        }
                      } else {
                        if (type.text.trim() == 'quiz') {
                          typeStr = 'quizz';
                        }
                      }
                      await controller.getGrades(
                        prefs!.getString('token')!,
                        int.parse(year.text.split(' ')[0]),
                        semester,
                        typeStr.toLowerCase(),
                      );
                      if (controller.errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(controller.errorMessage!)),
                        );
                        return;
                      }
                      if (controller.grades != null ||
                          controller.noResultsMessages != null) {
                        (controller.noResultsMessages != null)
                            ? ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${controller.noResultsMessages}',
                                ),
                              ),
                            )
                            : null;
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
                  ? SpinKitFadingGrid(color: Colors.indigo[900], size: 30)
                  : Text(
                    'button_text'.tr,
                    style: AppStyles.styleRegular22().copyWith(
                      color: Colors.white,
                    ),
                  ),
        );
      },
    );
  }
}
