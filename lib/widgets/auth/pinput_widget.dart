import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:pinput/pinput.dart';
import 'package:smartpath/controller/auth_controller/go_to_next_page_controller.dart';

class PinputWidget extends StatelessWidget {
  const PinputWidget({super.key, required this.controller, required this.pin});

  final TextEditingController controller;
  final String pin;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      length: 4,
      onCompleted: (String enteredPin) {
        if (enteredPin == pin) {
          goToNextPage();
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('error_pin'.tr)));
          controller.clear();
        }
      },
      obscureText: true,
      enableSuggestions: false,
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
  }
}
