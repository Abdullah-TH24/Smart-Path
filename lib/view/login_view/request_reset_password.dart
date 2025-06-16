// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/controller/login_controller/request_reset_password_controller.dart';
import 'package:smartpath/widgets/login/logo_with_title_component.dart';
import 'package:smartpath/widgets/login/request_button_widget.dart';
import 'package:smartpath/widgets/login/request_form_widget.dart';
import 'package:smartpath/widgets/login/title_with_desc_component.dart';

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
            const Gap(25),
            // Logo with title app
            const LogoWithTitle(),
            const Gap(35),
            // Email with description
            const TitleWithDesc(
              title: 'E-mail Required',
              desc: 'Please enter your email below',
            ),
            const Gap(75),
            // Form <E-mail>
            RequestForm(
              requestResetPassword: requestResetPassword,
              email: email,
            ),
            const Gap(110),
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
