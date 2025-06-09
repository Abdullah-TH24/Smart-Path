import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/widgets/login/button_component.dart';
import 'package:smartpath/widgets/login/password_field_component.dart';
import 'package:smartpath/controller/login_controller/hide_show_password_controller.dart';
import 'package:smartpath/controller/login_controller/verify_email_controller.dart';
import 'package:smartpath/controller/login_controller/verify_password_controller.dart';
import 'package:smartpath/utils/general_utils/app_assets.dart';
import 'package:smartpath/utils/general_utils/app_routes.dart';
import 'package:smartpath/utils/general_utils/app_styles.dart';
import 'package:smartpath/main.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});

  GlobalKey<FormState> login = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  HideShowPasswordController controller = Get.put(HideShowPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const SizedBox(height: 48),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.pngLogo, height: 62.06, width: 52.01),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'app_name'.tr,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 44.43),
              child: Text('sign_in'.tr, style: AppStyles.styleBold22()),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Text('sign_in_desc'.tr, style: AppStyles.styleRegular16()),
            ),
            const SizedBox(height: 44),
            // Form
            Form(
              key: login,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Text(
                    'email'.tr,
                    style: AppStyles.styleRegular16().copyWith(
                      color: Colors.indigo[400],
                    ),
                  ),
                  TextFormField(
                    controller: email,
                    validator: (value) => verifyEmail(value, value!.length),
                    style: const TextStyle(color: Colors.indigo),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'password'.tr,
                    style: AppStyles.styleRegular16().copyWith(
                      color: Colors.indigo[400],
                    ),
                  ),
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
                        validator:
                            (value) => verifyPassword(value, value!.length),
                        icon: Icon(controller.icon, color: Colors.indigo[400]),
                        obscureText: controller.obscureText,
                      );
                    },
                  ),
                ],
              ),
            ),
            // Sign In button
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ButtonComponent(
                onPressed: () {
                  prefs!.setString('login_state', 'true');
                  Get.offAllNamed(AppRoutes.languagesRoute);
                },
                data: 'sign_in'.tr,
              ),
            ),
            // Reset Password
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: InkWell(
                onTap: () {
                  controller.obscureText = true;
                  controller.icon = LucideIcons.eyeOff;
                  Get.toNamed(AppRoutes.resetPasswordRoute);
                },
                borderRadius: BorderRadius.circular(10),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Text(
                  'forgot_password'.tr,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleRegular16().copyWith(
                    color: Colors.indigo[500],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
