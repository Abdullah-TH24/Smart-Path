import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/core/utils/general_utils/app_assets.dart';
import 'package:smartpath/core/utils/general_utils/app_styles.dart';

class AppBarAfterScroll extends StatelessWidget {
  const AppBarAfterScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          const Image(image: AssetImage(AppAssets.pngLogo), width: 30),
          const Gap(12),
          Text(
            'app_bar_home_stu_title'.tr,
            style: AppStyles.styleMedium14().copyWith(color: Colors.indigo[50]),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(LucideIcons.bell, size: 20),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(LucideIcons.search, size: 20),
        ),
      ],
      actionsIconTheme: IconThemeData(color: Colors.indigo[50]),
    );
  }
}
