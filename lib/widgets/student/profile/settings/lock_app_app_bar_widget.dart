import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/widgets/student/profile/upper_waves_component.dart';

class LockAppAppBarWidget extends StatelessWidget {
  const LockAppAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 80,
      leading: IconButton(
        onPressed: () {
          Get.back();
          if (prefs!.getBool('lock_screen') == false) {
            prefs!.remove('pin_code');
            prefs!.remove('lock_screen');
            prefs!.remove('biometric');
          }
        },
        icon: Icon(
          (Get.locale?.languageCode ?? 'en') == 'en'
              ? LucideIcons.chevronLeft
              : LucideIcons.chevronRight,
          color: Colors.indigo,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: const UpperWaves(),
        centerTitle: true,
        title: Text(
          'Lock App'.tr,
          style: AppStyles.styleMedium14().copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
