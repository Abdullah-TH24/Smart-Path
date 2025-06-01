import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/components/login_component/button_component.dart';
import 'package:smartpath/components/login_component/password_field_component.dart';
import 'package:smartpath/controller/login_controller/hide_show_password_controller.dart';
import 'package:smartpath/controller/login_controller/verify_email_controller.dart';
import 'package:smartpath/controller/login_controller/verify_password_controller.dart';
import 'package:smartpath/core/utils/general_utils/app_assets.dart';
import 'package:smartpath/core/utils/general_utils/app_routes.dart';
import 'package:smartpath/core/utils/general_utils/app_styles.dart';
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
            const SizedBox(height: 84),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.pngLogo,
                  height: 62.06,
                  width: 52.01,
                  color: Colors.indigo, // TODO color
                  colorBlendMode: BlendMode.srcIn,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10), //
                  child: Text(
                    'app_name'.tr, // TODO color
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 44.43),
              child: Text(
                'sign_in'.tr,
                style: AppStyles.styleBold22(
                  context,
                  color: const Color(0xff303030),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'sign_in_desc'.tr,
                style: AppStyles.styleRegular16(
                  context,
                  color: const Color(0xff9E95A2),
                ), // TODO color
              ),
            ),
            const SizedBox(height: 44),
            // Form
            Form(
              key: login,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    'email'.tr,
                    style: AppStyles.styleRegular16(
                      context,
                      color: Colors.indigo,
                    ), // TODO color
                  ),
                  TextFormField(
                    controller: email,
                    validator: (value) => verifyEmail(value, value!.length),
                    style: const TextStyle(color: Colors.indigo), // TODO color
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'password'.tr,
                    style: AppStyles.styleRegular16(
                      context,
                      color: Colors.indigo,
                    ), // TODO color
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
                        icon: Icon(controller.icon),
                        obscureText: controller.obscureText,
                      );
                    },
                  ),
                ],
              ),
            ),
            // Sign In button
            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: ButtonComponent(
                onPressed: () {
                  prefs!.setString('login_state', 'true');
                  Get.offAllNamed(AppRoutes.homeStudentRoute);
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
                  style: AppStyles.styleRegular16(
                    context,
                    color: Colors.indigo,
                  ), // TODO color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
