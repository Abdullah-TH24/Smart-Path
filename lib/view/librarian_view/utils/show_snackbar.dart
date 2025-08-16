import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    duration: const Duration(seconds: 1),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: const Color.fromARGB(198, 241, 228, 215),
    dismissDirection: DismissDirection.horizontal,
  );
}
