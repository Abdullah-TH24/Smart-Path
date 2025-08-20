import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_colors.dart';

void showSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    duration: const Duration(seconds: 3),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: getColor().snackBarColor,
    dismissDirection: DismissDirection.horizontal,
  );
}
