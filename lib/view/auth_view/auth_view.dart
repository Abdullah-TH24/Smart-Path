import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/auth_controller/auth_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/widgets/auth/fingerprint_auth_widget.dart';
import 'package:smartpath/widgets/auth/pinput_widget.dart';
import 'package:smartpath/widgets/login/logo_with_title_component.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<AuthController>(
          init: AuthController(),
          builder: (controller) {
            return Column(
              children: [
                const Gap(75),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'title_pin'.tr,
                      style: AppStyles.styleBold22().copyWith(),
                    ),
                    const LogoWithTitle(),
                  ],
                ),
                const Gap(50),
                Text(
                  'desc_pin'.tr,
                  style: AppStyles.styleRegular16(),
                  textAlign: TextAlign.center,
                ),
                const Gap(25),
                PinputWidget(
                  controller: controller.controller,
                  pin: controller.pin,
                ),
                const Spacer(),
                if (controller.biometricAvailable)
                  if (prefs!.getBool('biometric') ?? false)
                    FingerprintAuthWidget(controller: controller),
              ],
            );
          },
        ),
      ),
    );
  }
}
