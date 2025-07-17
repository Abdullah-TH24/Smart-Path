import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsetsGeometry.only(left: 5, right: 5),
      child: const Divider(color: Colors.black54),
    );
  }
}
