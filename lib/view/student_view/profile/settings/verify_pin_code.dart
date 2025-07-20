// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/auth_controller/auth_controller.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/widgets/student/home/calendar/app_bar_component.dart';
import 'package:smartpath/widgets/student/profile/settings/fingerprint_widget.dart';
import 'package:smartpath/widgets/student/profile/settings/pinput_component.dart';

class VerifyPinCode extends StatelessWidget {
  VerifyPinCode({super.key});
  TextEditingController pin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          AppBarComponent(data: 'verify_title'.tr),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(top: 75),
              child: Column(
                children: [
                  Text('vPin_title'.tr, style: AppStyles.styleBold24()),
                  const Gap(10),
                  Text('pin_desc'.tr, style: AppStyles.styleRegular14()),
                  const Gap(75),
                  PinputComponent(
                    pin: pin,
                    onCompleted: (value) {
                      if (prefs!.getString('pin_code') == pin.text) {
                        Get.offNamed(AppRoutes.studentProfileLockApp);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('vPin_error'.tr)),
                        );
                      }
                      pin.clear();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          (prefs!.getBool('biometric') ?? false)
              ? GetBuilder<AuthController>(
                init: AuthController(),
                builder: (controller) {
                  return SizedBox(
                    height: 150,
                    child: FingerprintWidget(controller: controller),
                  );
                },
              )
              : null,
    );
  }
}
