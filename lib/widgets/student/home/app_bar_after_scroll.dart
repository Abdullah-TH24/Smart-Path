// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/core/utils/general_utils/app_assets.dart';
import 'package:smartpath/core/utils/general_utils/app_styles.dart';

class AppBarAfterScroll extends StatelessWidget {
  AppBarAfterScroll({super.key});

  LocalizationController locale = Get.find();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Image(
            image: const AssetImage(AppAssets.pngLogo),
            width: 30,
            colorBlendMode: BlendMode.srcIn,
            color:
                locale.initailLang == const Locale('en') ||
                        locale.initailLang == Get.deviceLocale
                    ? Colors.indigo
                    : Colors.indigo[100],
          ),
          const Gap(12),
          Text(
            'app_bar_home_stu_title'.tr,
            style: AppStyles.styleMedium14().copyWith(
              color: Colors.indigo[50],
              shadows: [
                const BoxShadow(
                  blurRadius: 2,
                  color: Colors.black26,
                  offset: Offset(1, 1),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            LucideIcons.bell,
            size: 20,
            shadows:
                locale.initailLang == const Locale('en') ||
                        locale.initailLang == Get.deviceLocale
                    ? null
                    : [
                      const BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(1, 1),
                      ),
                    ],
          ),
        ),
      ],
      actionsIconTheme: IconThemeData(color: Colors.indigo[50]),
    );
  }
}
