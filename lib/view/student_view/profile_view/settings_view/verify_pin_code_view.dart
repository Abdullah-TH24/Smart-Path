// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/auth_controller/auth_controller.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/view/librarian_view/utils/show_snackbar.dart';
import 'package:smartpath/widgets/student_widget/home_widget/calendar_widget/app_bar_component.dart';
import 'package:smartpath/widgets/student_widget/profile_widget/settings/fingerprint_widget.dart';
import 'package:smartpath/widgets/student_widget/profile_widget/settings/pinput_component.dart';

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
                  const Gap(60),
                  GetBuilder<AuthController>(
                    init: AuthController(),
                    builder: (controller) {
                      return PinputComponent(
                        pin: pin,
                        onCompleted: (value) async {
                          await controller.checkPinCode(
                            prefs!.getString('token')!,
                            value,
                          );
                          if (controller.resCheck != null) {
                            if (controller.resCheck!) {
                              Get.offNamed(AppRoutes.studentProfileLockApp);
                            } else {
                              showSnackbar('Error'.tr, 'vPin_error'.tr);
                            }
                          } else {
                            showSnackbar('Error'.tr, controller.errorMessage!);
                          }
                          pin.clear();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: (prefs!.getBool('biometric') ?? false)
          ? GetBuilder<AuthController>(
              init: AuthController(),
              builder: (controller) {
                return Container(
                  color: Colors.indigo[50],
                  height: 150,
                  child: FingerprintWidget(controller: controller),
                );
              },
            )
          : null,
    );
  }
}
