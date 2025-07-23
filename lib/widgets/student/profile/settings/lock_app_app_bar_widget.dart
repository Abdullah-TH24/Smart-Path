// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/auth_controller/delete_pin_code_controller.dart';
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
      leading: GetBuilder<DeletePinCodeController>(
        init: DeletePinCodeController(),
        builder: (controller) {
          return IconButton(
            onPressed: () async {
              if (prefs!.getBool('lock_screen') == false) {
                await controller.deletePinCode(prefs!.getString('token')!);
                if (controller.resDelete != null) {
                  if (controller.resDelete!) {
                    prefs!.remove('lock_screen');
                    prefs!.remove('biometric');
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(controller.errorMessage!)),
                  );
                }
              }
              Get.back();
            },
            icon: Icon(
              (Get.locale?.languageCode ?? 'en') == 'en'
                  ? LucideIcons.chevronLeft
                  : LucideIcons.chevronRight,
              color: Colors.indigo,
            ),
          );
        },
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
