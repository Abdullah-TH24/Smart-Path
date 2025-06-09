import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/widgets/login/button_component.dart';
import 'package:smartpath/widgets/login/password_field_component.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/controller/login_controller/hide_show_password_controller.dart';
import 'package:smartpath/controller/login_controller/verify_password_controller.dart';
import 'package:smartpath/controller/login_controller/verify_same_password.dart';
import 'package:smartpath/utils/general_utils/app_assets.dart';
import 'package:smartpath/utils/general_utils/app_styles.dart';

// ignore: must_be_immutable
class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  GlobalKey<FormState> resetPassword = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  LocalizationController locale = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            locale.initailLang == const Locale('en') ||
                    locale.initailLang == Get.deviceLocale
                ? LucideIcons.chevronLeft
                : LucideIcons.chevronRight,
            color: Colors.indigo,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const SizedBox(height: 34),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.pngLogo,
                  height: 62.06,
                  width: 52.01,
                  color: Colors.indigo,
                  colorBlendMode: BlendMode.srcIn,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10), //
                  child: Text(
                    'app_name'.tr,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 44.43),
              child: Text('reset_tite'.tr, style: AppStyles.styleBold22()),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Text('reset_desc'.tr, style: AppStyles.styleRegular16()),
            ),
            const SizedBox(height: 44),
            // Form
            Form(
              key: resetPassword,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text('password_reset'.tr, style: AppStyles.styleRegular16()),
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
                        icon: Icon(controller.icon, color: Colors.indigo),
                        obscureText: controller.obscureText,
                      );
                    },
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'password_confirm_reset'.tr,
                    style: AppStyles.styleRegular16(),
                  ),
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
                        validator:
                            (value) => verfiySamePassword(value, password.text),
                        icon: Icon(
                          controller.iconConfirm,
                          color: Colors.indigo,
                        ),
                        obscureText: controller.obscureTextConfirm,
                      );
                    },
                  ),
                ],
              ),
            ),
            // Reset Password button
            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: ButtonComponent(
                onPressed: () {},
                data: 'reset_tite'.tr,
              ), // TODO enable the button and add a dialog
            ),
          ],
        ),
      ),
    );
  }
}
