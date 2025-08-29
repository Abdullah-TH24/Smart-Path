// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/localization_controller/localization_controller.dart';
import 'package:smartpath/controller/login_controller/request_reset_password_controller.dart';
import 'package:smartpath/widgets/login_widget/logo_with_title_component.dart';
import 'package:smartpath/widgets/login_widget/request_button_widget.dart';
import 'package:smartpath/widgets/login_widget/request_form_widget.dart';
import 'package:smartpath/widgets/login_widget/title_with_desc_component.dart';

class RequestResetPassword extends StatelessWidget {
  RequestResetPassword({super.key});

  GlobalKey<FormState> requestResetPassword = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  LocalizationController locale = Get.find();

  @override
  Widget build(BuildContext context) {
    final RequestResetPasswordController requestRPController = Get.put(
      RequestResetPasswordController(),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          onPressed: () {
            Get.back();
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
            const Gap(25),
            // Logo with title app
            const LogoWithTitle(),
            const Gap(25),
            // Email with description
            TitleWithDesc(
              title: 'request_email_title'.tr,
              desc: 'request_email_desc'.tr,
            ),
            const Gap(65),
            // Form <E-mail>
            RequestForm(
              requestResetPassword: requestResetPassword,
              email: email,
            ),
            const Gap(90),
            // <Send> Button
            RequestButton(
              requestResetPassword: requestResetPassword,
              requestRPController: requestRPController,
              email: email,
            ),
          ],
        ),
      ),
    );
  }
}
