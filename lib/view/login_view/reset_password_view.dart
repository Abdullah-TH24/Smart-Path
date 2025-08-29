// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/login_controller/reset_password_controller.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/widgets/login_widget/logo_with_title_component.dart';
import 'package:smartpath/controller/localization_controller/localization_controller.dart';
import 'package:smartpath/widgets/login_widget/reset_password_button_widget.dart';
import 'package:smartpath/widgets/login_widget/reset_password_form_widget.dart';
import 'package:smartpath/widgets/login_widget/title_with_desc_component.dart';

// ignore: must_be_immutable
class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  GlobalKey<FormState> resetPassword = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  LocalizationController locale = Get.find();
  final String email = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final ResetPasswordController resetPasswordController = Get.put(
      ResetPasswordController(),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed(AppRoutes.loginRoute);
          },
          icon: Icon(
            (Get.locale?.languageCode ?? 'en') == 'en'
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
            ResetPasswordButton(
              resetPassword: resetPassword,
              resetPasswordController: resetPasswordController,
              email: email,
              password: password,
            ),
          ],
        ),
      ),
    );
  }
}
