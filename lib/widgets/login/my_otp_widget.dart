// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/login_controller/attempts_controller.dart';
import 'package:smartpath/controller/login_controller/send_otp_code_controller.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class MyOtpWidget extends StatefulWidget {
  final SendOtpCodeController sendOtpCodeController;
  final String email;
  const MyOtpWidget({
    super.key,
    required this.email,
    required this.sendOtpCodeController,
  });

  @override
  State<MyOtpWidget> createState() => _MyOtpWidgetState();
}

class _MyOtpWidgetState extends State<MyOtpWidget> {
  bool isValidCode = false;
  bool isInvalidValidCode = false;
  Attempts attempts = Get.put(Attempts());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Code fields
        OtpTextField(
          numberOfFields: 5,
          showFieldAsBox: true,
          filled: true,
          fillColor: Colors.indigo[100]!,
          borderRadius: BorderRadius.circular(12.5),
          fieldHeight: 50,
          fieldWidth: 40,
          showCursor: false,
          textStyle: AppStyles.styleRegular14().copyWith(),
          enabledBorderColor:
              isValidCode
                  ? Colors.indigo
                  : isInvalidValidCode
                  ? Colors.red[900]!
                  : Colors.transparent,
          focusedBorderColor: Colors.indigo[300]!,
          onCodeChanged: (value) {
            isValidCode = false;
            isInvalidValidCode = false;
            setState(() {});
          },
          onSubmit: (String verificationCode) async {
            await widget.sendOtpCodeController.otpCode(
              widget.email,
              verificationCode,
            );
            if (widget.sendOtpCodeController.errorMessage != null) {
              await showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text('error'.tr, textAlign: TextAlign.center),
                      content: Text(
                        '${widget.sendOtpCodeController.errorMessage}',
                        textAlign: TextAlign.center,
                      ),
                    ),
              );
            }
            if (widget.sendOtpCodeController.otpResponse != null) {
              if (widget.sendOtpCodeController.otpResponse!) {
                isValidCode = true;
                setState(() {});
                await Future.delayed(const Duration(seconds: 2));
                Get.offAllNamed(
                  AppRoutes.resetPasswordRoute,
                  arguments: widget.email,
                );
              } else {
                isInvalidValidCode = true;
                attempts.decrement();
                if (attempts.attempts == 0) {
                  await showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: Text('error'.tr, textAlign: TextAlign.center),
                          content: Text(
                            'limit_empty'.tr,
                            textAlign: TextAlign.center,
                          ),
                        ),
                  );
                  Get.close(1);
                  Get.offNamed(AppRoutes.requestResetPassword);
                  return;
                }
                setState(() {});
                await showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: Text('error'.tr, textAlign: TextAlign.center),
                        content: Text(
                          'error_in_code'.tr,
                          textAlign: TextAlign.center,
                        ),
                      ),
                );
              }
            }
          },
        ),
        const Gap(10),
        GetBuilder<Attempts>(
          builder: (controller) {
            return Text(
              '${'You have'.tr} ${controller.attempts} ${'attempts'.tr}',
            );
          },
        ),
      ],
    );
  }
}
