import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_colors.dart';

Widget customTextField(
  String label,
  TextEditingController controller, {
  int maxLines = 1,
  Widget? scan,
}) {
  return Row(
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(color: getColor().buttonText),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              filled: true,
              fillColor: getColor().textField,
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) => value == null || value.isEmpty
                ? '${'required_field'.tr} : $label'
                : null,
          ),
        ),
      ),
      scan == null ? const Gap(0) : const Gap(16),
      ?scan,
    ],
  );
}
