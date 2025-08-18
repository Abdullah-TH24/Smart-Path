import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/main.dart';

Widget librarianCustomTextField(
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
              labelStyle: const TextStyle(color: Colors.brown),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              filled: true,
              fillColor: getColor(),
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

Color getColor() {
  switch (prefs!.getString('role')) {
    case 'student':
      return const Color.fromARGB(255, 159, 168, 218);
    case 'teacher':
      return Colors.indigo;
    case 'supervisor':
      return const Color.fromARGB(199, 231, 218, 205);
    case 'librarian':
      return Colors.indigo;
    default:
      return Colors.transparent;
  }
}
