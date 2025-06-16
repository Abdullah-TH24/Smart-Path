// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/core/utils/general_utils/app_routes.dart';
import 'package:smartpath/core/utils/general_utils/app_styles.dart';

class ProfileNamePhotoRow extends StatelessWidget {
  ProfileNamePhotoRow({super.key});

  LocalizationController locale = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.studentProfileInfo);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Gap(16),
              const CircleAvatar(radius: 40, child: Icon(LucideIcons.camera)),
              const Gap(24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hi ,', style: AppStyles.styleRegular16().copyWith()),
                  Text(
                    'Abdullah Hamid',
                    style: AppStyles.styleMedium20().copyWith(),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              locale.initailLang == const Locale('en') ||
                      locale.initailLang == Get.deviceLocale
                  ? LucideIcons.chevronRight
                  : LucideIcons.chevronLeft,
              color: const Color(0xffA0A0A0),
            ),
          ),
        ],
      ),
    );
  }
}
