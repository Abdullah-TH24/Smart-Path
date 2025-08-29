// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/profile_controller/settings_controller/select_language_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/student_widget/profile_widget/settings/radio_component.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectLanguageController>(
      init: SelectLanguageController(),
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('lang_title'.tr, style: AppStyles.styleBold16()),
              const Gap(20),
              RadioComponent(
                groupLangauge: controller.groupLangauge!,
                title: 'Arabic'.tr,
                value: 1,
                onChanged: (value) {
                  controller.changeLanguageToArabic();
                  controller.groupLangauge = value;
                },
                activeColor: Colors.indigo,
              ),
              RadioComponent(
                groupLangauge: controller.groupLangauge!,
                title: 'English'.tr,
                value: 2,
                onChanged: (value) {
                  controller.changeLanguageToEnglish();
                  controller.groupLangauge = value;
                },
                activeColor: Colors.indigo,
              ),
            ],
          ),
        );
      },
    );
  }
}
