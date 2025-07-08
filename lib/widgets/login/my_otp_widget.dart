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
  bool isInvalidCode = false;
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
                  : isInvalidCode
                  ? Colors.red[900]!
                  : Colors.transparent,
          focusedBorderColor: Colors.indigo[300]!,
          onCodeChanged: (value) {
            isValidCode = false;
            isInvalidCode = false;
            setState(() {});
          },
          onSubmit: (String verificationCode) async {
            await widget.sendOtpCodeController.otpCode(
              widget.email,
              verificationCode,
            );
            if (widget.sendOtpCodeController.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${widget.sendOtpCodeController.errorMessage}'),
                ),
              );
              return;
            }
            if (widget.sendOtpCodeController.response != null) {
              if (widget.sendOtpCodeController.response!) {
                isValidCode = true;
                setState(() {});
                await Future.delayed(const Duration(seconds: 2));
                Get.offAllNamed(
                  AppRoutes.resetPasswordRoute,
                  arguments: widget.email,
                );
              } else {
                isInvalidCode = true;
                attempts.decrement();
                if (attempts.attempts == 0) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('limit_empty'.tr)));
                  Get.offNamed(AppRoutes.requestResetPassword);
                  return;
                }
                setState(() {});
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('error_in_code'.tr)));
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
