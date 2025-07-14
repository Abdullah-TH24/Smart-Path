// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/widgets/student/home/calendar/calendar_app_bar_widget.dart';
import 'package:smartpath/widgets/student/profile/settings/pinput_component.dart';

class ConfirmPinCode extends StatelessWidget {
  ConfirmPinCode({super.key});
  TextEditingController pin = TextEditingController();
  String pinCode = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarComponent(data: 'Lock App'),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(top: 75),
              child: Column(
                children: [
                  Text('confirm_title'.tr, style: AppStyles.styleBold24()),
                  const Gap(10),
                  Text(
                    'confirm_desc'.tr,
                    style: AppStyles.styleRegular14(),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(75),
                  PinputComponent(
                    pin: pin,
                    onCompleted: (value) {
                      if (pin.text == pinCode) {
                        prefs!.setString('pin_code', pin.text);
                        Get.close(2);
                        Get.toNamed(AppRoutes.studentProfileLockApp);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('confirm_error'.tr)),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
