import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:smartpath/utils/general_utils/app_assets.dart';
import 'package:smartpath/utils/general_utils/app_styles.dart';

class AppBarAfterScroll extends StatelessWidget {
  const AppBarAfterScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          const Image(image: AssetImage(Assets.pngLogo), width: 30),
          const Gap(12),
          Text(
            'app_bar_home_stu_title'.tr,
            style: AppStyles.styleMedium14().copyWith(color: Colors.indigo[50]),
          ),
        ],
      ),
      actions: const [
        Icon(Icons.notifications),
        Gap(12),
        Icon(Icons.search),
        Gap(12),
      ],
      actionsIconTheme: IconThemeData(color: Colors.indigo[50]),
    );
  }
}
