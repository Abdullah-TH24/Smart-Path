// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/login_controller/reset_password_controller.dart';
import 'package:smartpath/core/utils/general_utils/app_routes.dart';
import 'package:smartpath/core/utils/general_utils/app_styles.dart';
import 'package:smartpath/widgets/login/button_component.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({
    super.key,
    required this.resetPassword,
    required this.resetPasswordController,
    required this.email,
    required this.password,
  });

  final GlobalKey<FormState> resetPassword;
  final ResetPasswordController resetPasswordController;
  final String email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(
      init: ResetPasswordController(),
      builder: (controller) {
        return ButtonComponent(
          onPressed:
              (controller.isLoading)
                  ? null
                  : () async {
                    if (resetPassword.currentState!.validate()) {
                      await resetPasswordController.resetPassword(
                        email,
                        password.text.trim(),
                      );
                      if (resetPasswordController.errorMessage != null) {
                        await showDialog(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                title: Text(
                                  'error'.tr,
                                  textAlign: TextAlign.center,
                                ),
                                content: Text(
                                  '${resetPasswordController.errorMessage}',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                        );
                      }
                      if (resetPasswordController.resetResponse != null) {
                        if (resetPasswordController.resetResponse!.status) {
                          Get.offAllNamed(AppRoutes.loginRoute);
                        } else {
                          await showDialog(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  title: Text(
                                    'error'.tr,
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Text(
                                    '${resetPasswordController.resetResponse?.message}',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                          );
                        }
                      }
                    }
                  },
          child:
              (controller.isLoading)
                  ? SpinKitFadingGrid(color: Colors.indigo[900], size: 30)
                  : Text(
                    'reset_tite'.tr,
                    style: AppStyles.styleRegular22().copyWith(
                      color: Colors.white,
                    ),
                  ),
        );
      },
    );
  }
}
