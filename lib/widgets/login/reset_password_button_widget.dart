// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/login_controller/reset_password_controller.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';
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
                    FocusScope.of(context).unfocus();
                    if (resetPassword.currentState!.validate()) {
                      await resetPasswordController.resetPassword(
                        email,
                        password.text.trim(),
                      );
                      if (controller.errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${controller.errorMessage}')),
                        );
                        return;
                      }
                      if (controller.response != null) {
                        if (controller.response!.status) {
                          Get.offAllNamed(AppRoutes.loginRoute);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${controller.response?.message}'),
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
