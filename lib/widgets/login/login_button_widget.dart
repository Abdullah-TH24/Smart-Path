// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/localization_controller/localization_controller.dart';
import 'package:smartpath/controller/login_controller/login_controller.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/view/teacher_view/teacher_routes.dart';
import 'package:smartpath/widgets/login/button_component.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.loginController,
    required this.email,
    required this.password,
    required this.login,
    required this.locale,
  });
  final GlobalKey<FormState> login;
  final LoginController loginController;
  final TextEditingController email;
  final TextEditingController password;
  final LocalizationController locale;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return ButtonComponent(
          onPressed:
              (controller.isLoading)
                  ? null
                  : () async {
                    FocusScope.of(context).unfocus();
                    if (login.currentState!.validate()) {
                      await loginController.login(
                        email.text.trim(),
                        password.text.trim(),
                      );
                      if (controller.errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${loginController.errorMessage}'),
                          ),
                        );
                        return;
                      }
                      if (controller.response != null) {
                        if (controller.response?.status == true) {
                          if (controller.response?.role == 'student') {
                            Get.offAllNamed(AppRoutes.studentMainPageRoute);
                          } else if (controller.response?.role == 'teacher') {
                            // TODO put your navigator here
                            Get.offAllNamed(TeacherRoutes.profile);
                          }
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
                    'sign_in'.tr,
                    style: AppStyles.styleRegular22().copyWith(
                      color: Colors.white,
                    ),
                  ),
        );
      },
    );
  }
}
