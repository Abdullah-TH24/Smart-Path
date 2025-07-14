// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/localization_controller/localization_controller.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_styles.dart';

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
                (Get.locale?.languageCode ?? 'en') == 'en'
                    ? Colors.indigo
                    : Colors.indigo[100],
          ),
          const Gap(12),
          Text(
            'app_name'.tr,
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
                (Get.locale?.languageCode ?? 'en') == 'en'
                    ? null
                    : [
                      const BoxShadow(
                        color: Colors.black,
                        blurRadius: 7.5,
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
