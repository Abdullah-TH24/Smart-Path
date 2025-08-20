import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/events/events_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class RightSideWidget extends StatelessWidget {
  const RightSideWidget({
    super.key,
    required this.controller,
    required this.index,
  });

  final EventsController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (Get.locale?.languageCode ?? 'en') == 'en'
            ? Text(
              controller.events![index].commentNumber! > 0
                  ? '${controller.events![index].commentNumber!} ${'many_comment'.tr}'
                  : '',
              style: AppStyles.styleRegular12().copyWith(color: Colors.black87),
            )
            : Text(
              controller.events![index].commentNumber! == 1
                  ? 'one_comment'.tr
                  : controller.events![index].commentNumber! == 2
                  ? 'two_comment'.tr
                  : controller.events![index].commentNumber! > 0
                  ? '${controller.events![index].commentNumber!} ${'many_comment'.tr}'
                  : '',
              style: AppStyles.styleRegular12().copyWith(color: Colors.black87),
            ),
        const Gap(7.5),
        (Get.locale?.languageCode ?? 'en') == 'en'
            ? Text(
              controller.events![index].commentNumber! > 0
                  ? '${controller.events![index].commentNumber!} ${'many_share'.tr}'
                  : '',
              style: AppStyles.styleRegular12().copyWith(color: Colors.black87),
            )
            : Text(
              controller.events![index].commentNumber! == 1
                  ? 'one_share'.tr
                  : controller.events![index].commentNumber! == 2
                  ? 'two_share'.tr
                  : controller.events![index].commentNumber! > 0
                  ? '${controller.events![index].commentNumber!} ${'many_share'.tr}'
                  : '', // TODO to edit comment to share
              style: AppStyles.styleRegular12().copyWith(color: Colors.black87),
            ),
      ],
    );
  }
}
