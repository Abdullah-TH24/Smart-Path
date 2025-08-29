// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/localization_controller/localization_controller.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class WelcomeItem extends StatelessWidget {
  WelcomeItem({super.key});

  LocalizationController locale = Get.find();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 140,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [Colors.indigo[600]!, Colors.indigo[300]!],
            begin:
                (Get.locale?.languageCode ?? 'en') == 'en'
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
            end:
                (Get.locale?.languageCode ?? 'en') == 'en'
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with Title
            Row(
              children: [
                Image.asset(
                  AppAssets.pngLogo,
                  width: 29.33,
                  colorBlendMode: BlendMode.srcIn,
                  color: Colors.indigo[100],
                ),
                const Gap(5),
                Text(
                  'app_name'.tr,
                  style: AppStyles.styleMedium14().copyWith(
                    color: Colors.indigo[50],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Text(
              'welcome-content'.tr,
              style: AppStyles.styleMedium14().copyWith(
                color: Colors.indigo[50],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
