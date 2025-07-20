// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/student/home/calendar/app_bar_component.dart';
import 'package:smartpath/widgets/student/profile/settings/pinput_component.dart';

class EnterPinCode extends StatelessWidget {
  EnterPinCode({super.key});
  TextEditingController pin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarComponent(data: 'Lock App'.tr),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(top: 75),
              child: Column(
                children: [
                  Text(
                    'title_pin'.tr,
                    style: AppStyles.styleBold24(),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(10),
                  Text('pin_desc'.tr, style: AppStyles.styleRegular14()),
                  const Gap(75),
                  PinputComponent(
                    pin: pin,
                    onCompleted: (value) {
                      Get.toNamed(
                        AppRoutes.studentProfileConfirmPIN,
                        arguments: pin.text,
                      );
                      pin.clear();
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
