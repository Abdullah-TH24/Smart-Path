import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/core/utils/general_utils/app_styles.dart';
import 'package:smartpath/widgets/login/button_component.dart';
import 'package:smartpath/widgets/login/logo_with_title_component.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/widgets/login/reset_password_form_widget.dart';
import 'package:smartpath/widgets/login/title_with_desc_component.dart';

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
            const Gap(30),
            // Logo with title app
            const LogoWithTitle(),
            // Reset password with description
            TitleWithDesc(title: 'reset_tite'.tr, desc: 'reset_desc'.tr),
            const Gap(44),
            // Form <Password, Confirm Password>
            ResetPasswordForm(
              resetPassword: resetPassword,
              password: password,
              confirmPassword: confirmPassword,
            ),
            const Gap(75),
            // <Reset Password> button
            ButtonComponent(
              onPressed: () {},
              child: Text(
                'reset_tite'.tr,
                style: AppStyles.styleRegular22().copyWith(color: Colors.white),
              ),
            ),
            // TODO enable the button and add a dialog
          ],
        ),
      ),
    );
  }
}
