// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/localization_controller/localization_controller.dart';
import 'package:smartpath/controller/login_controller/send_otp_code_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/login/my_otp_widget.dart';

class EnterVerificationCode extends StatelessWidget {
  EnterVerificationCode({super.key});

  final String email = Get.arguments['email'];
  LocalizationController locale = Get.find();

  @override
  Widget build(BuildContext context) {
    final SendOtpCodeController sendOtpCodeController = Get.put(
      SendOtpCodeController(),
    );
    return Scaffold(
      appBar: AppBar(
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
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                'verification_code'.tr,
                style: AppStyles.styleBold24(),
                textAlign: TextAlign.center,
              ),
              const Gap(10),
              Text(
                '${'verification_code_desc'.tr}$email',
                style: AppStyles.styleRegular14(),
                textAlign: TextAlign.center,
              ),
              const Gap(75),
              MyOtpWidget(
                email: email,
                sendOtpCodeController: sendOtpCodeController,
              ),
              const Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}
