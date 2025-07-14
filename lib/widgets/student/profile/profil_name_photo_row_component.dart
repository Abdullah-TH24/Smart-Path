// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/localization_controller/localization_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class ProfileNamePhotoRow extends StatelessWidget {
  final String studentName;
  ProfileNamePhotoRow({super.key, required this.studentName});

  LocalizationController locale = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(16),
        const CircleAvatar(radius: 40, child: Icon(LucideIcons.camera)),
        const Gap(24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('hi'.tr, style: AppStyles.styleRegular16().copyWith()),
            Text(studentName, style: AppStyles.styleMedium20().copyWith()),
          ],
        ),
      ],
    );
  }
}
