// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/auth_controller/create_or_update_pin_code_controller.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/view/librarian_view/utils/show_snackbar.dart';
import 'package:smartpath/widgets/student_widget/home_widget/calendar_widget/app_bar_component.dart';
import 'package:smartpath/widgets/student_widget/profile_widget/settings/pinput_component.dart';

class ConfirmPinCode extends StatelessWidget {
  ConfirmPinCode({super.key});
  TextEditingController pin = TextEditingController();
  String pinCode = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarComponent(data: 'Lock App'.tr),
          SliverToBoxAdapter(
            child: GetBuilder<CreateOrUpdatePinCode>(
              init: CreateOrUpdatePinCode(),
              builder: (controller) {
                return Container(
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
                        onCompleted: (value) async {
                          if (pin.text == pinCode) {
                            await controller.createOrUpdatePinCode(
                              prefs!.getString('token')!,
                              pin.text,
                              pinCode,
                            );
                            if (controller.resCreateOrUpdate != null) {
                              if (controller.resCreateOrUpdate!) {
                                prefs!.setString('pin_code', pinCode);
                                Get.close(2);
                                Get.toNamed(AppRoutes.studentProfileLockApp);
                              }
                            } else if (controller.errorMessage != null) {
                              showSnackbar(
                                'Error'.tr,
                                controller.errorMessage!,
                              );
                            }
                          } else {
                            showSnackbar('Error'.tr, 'confirm_error'.tr);
                          }
                        },
                      ),
                      const Gap(175),
                      (controller.isLoading)
                          ? const SpinKitSpinningLines(color: Colors.indigo)
                          : Container(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
