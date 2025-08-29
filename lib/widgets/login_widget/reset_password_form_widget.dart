import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/login_controller/hide_show_password_controller.dart';
import 'package:smartpath/controller/login_controller/verify_password_controller.dart';
import 'package:smartpath/controller/login_controller/verify_same_password_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/login_widget/password_field_component.dart';

class ResetPasswordForm extends StatelessWidget {
  final GlobalKey<FormState> resetPassword;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  const ResetPasswordForm({
    super.key,
    required this.resetPassword,
    required this.password,
    required this.confirmPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: resetPassword,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          // <Password> word
          Text('password_reset'.tr, style: AppStyles.styleRegular16()),
          // <Password> field with state management to show and hide password
          GetBuilder<HideShowPasswordController>(
            init: HideShowPasswordController(),
            builder: (controller) {
              return PasswordFieldComponent(
                controller: password,
                onPressed: () {
                  if (controller.obscureText) {
                    controller.showPassword();
                  } else {
                    controller.hidePassword();
                  }
                },
                validator: (value) => verifyPassword(value, value!.length),
                icon: Icon(controller.icon, color: Colors.indigo),
                obscureText: controller.obscureText,
              );
            },
          ),
          const Gap(25),
          // <Confirm Password> word
          Text('password_confirm_reset'.tr, style: AppStyles.styleRegular16()),
          // <Confirm Password> field with state management to show and hide password
          GetBuilder<HideShowPasswordController>(
            init: HideShowPasswordController(),
            builder: (controller) {
              return PasswordFieldComponent(
                controller: confirmPassword,
                onPressed: () {
                  if (controller.obscureTextConfirm) {
                    controller.showPasswordConfirm();
                  } else {
                    controller.hidePasswordConfirm();
                  }
                },
                validator: (value) => verfiySamePassword(password.text, value),
                icon: Icon(controller.iconConfirm, color: Colors.indigo),
                obscureText: controller.obscureTextConfirm,
              );
            },
          ),
        ],
      ),
    );
  }
}
