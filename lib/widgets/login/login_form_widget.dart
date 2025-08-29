import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/login_controller/hide_show_password_controller.dart';
import 'package:smartpath/controller/login_controller/verify_email_controller.dart';
import 'package:smartpath/controller/login_controller/verify_password_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/login/password_field_component.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> login;
  final TextEditingController email;
  final TextEditingController password;
  const LoginForm({
    super.key,
    required this.login,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: login,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          // <E-mail> word
          Text(
            'email'.tr,
            style: AppStyles.styleRegular16().copyWith(
              color: Colors.indigo[400],
            ),
          ),
          // <E-mail> field
          TextFormField(
            controller: email,
            validator: (value) => verifyEmail(value, value!.length),
            style: const TextStyle(color: Colors.indigo),
            keyboardType: TextInputType.emailAddress,
          ),
          const Gap(25),
          // <Password> word
          Text(
            'password'.tr,
            style: AppStyles.styleRegular16().copyWith(
              color: Colors.indigo[400],
            ),
          ),
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
                // validator: (value) => verifyPassword(value, value!.length),
                icon: Icon(controller.icon, color: Colors.indigo[400]),
                obscureText: controller.obscureText,
              );
            },
          ),
        ],
      ),
    );
  }
}
