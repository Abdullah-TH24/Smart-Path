import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({super.key, this.buttonColor});
  Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.indigo[50],
          filled: true,
          hintText: 'search_bar_home_hint'.tr,
          hintStyle: AppStyles.styleRegular14().copyWith(
            color: const Color(0xff9E95A2),
          ),
          suffix: GestureDetector(
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: buttonColor ?? const Color.fromARGB(255, 37, 61, 194),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Icon(LucideIcons.search, color: Colors.white, size: 14),
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
