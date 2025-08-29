// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:smartpath/controller/auth_controller/auth_controller.dart';
import 'package:smartpath/controller/auth_controller/go_to_next_page_controller.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/view/librarian_view/utils/show_snackbar.dart';

class PinputWidget extends StatelessWidget {
  const PinputWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (authController) {
        return Pinput(
          controller: controller,
          length: 4,
          onCompleted: (String enteredPin) async {
            await authController.checkPinCode(
              prefs!.getString('token')!,
              enteredPin,
            );
            controller.clear();
            if (authController.resCheck != null) {
              if (authController.resCheck!) {
                goToNextPage();
              } else {
                showSnackbar('Error'.tr, 'error_pin'.tr);
              }
            } else {
              showSnackbar('Error'.tr, authController.errorMessage!);
            }
            controller.clear();
          },
          obscureText: true,
          enableSuggestions: false,
          showCursor: false,
          obscuringWidget: const Icon(
            Icons.circle,
            size: 7.5,
            color: Colors.indigo,
          ),
          defaultPinTheme: PinTheme(
            width: 40,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.indigo[100],
              borderRadius: BorderRadius.circular(12.5),
            ),
          ),
        );
      },
    );
  }
}
