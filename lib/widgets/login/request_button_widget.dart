// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/login_controller/request_reset_password_controller.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/login/button_component.dart';

class RequestButton extends StatelessWidget {
  const RequestButton({
    super.key,
    required this.requestResetPassword,
    required this.requestRPController,
    required this.email,
  });

  final GlobalKey<FormState> requestResetPassword;
  final RequestResetPasswordController requestRPController;
  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestResetPasswordController>(
      builder: (controller) {
        return ButtonComponent(
          onPressed:
              (controller.isLoading)
                  ? null
                  : () async {
                    FocusScope.of(context).unfocus();
                    if (requestResetPassword.currentState!.validate()) {
                      await controller.sendEmail(email.text.trim());
                      if (controller.errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${controller.errorMessage}')),
                        );
                        return;
                      }
                      if (controller.response != null) {
                        if (requestRPController.response?.status == 200) {
                          Get.toNamed(
                            AppRoutes.enterVerificationCode,
                            arguments: {'email': email.text.trim()},
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${controller.response?.message}'),
                            ),
                          );
                          return;
                        }
                      }
                    }
                  },
          child:
              (controller.isLoading)
                  ? SpinKitFadingGrid(color: Colors.indigo[900], size: 30)
                  : Text(
                    'send'.tr,
                    style: AppStyles.styleRegular22().copyWith(
                      color: Colors.white,
                    ),
                  ),
        );
      },
    );
  }
}
