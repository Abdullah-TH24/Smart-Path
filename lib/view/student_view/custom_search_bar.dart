import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/utils/general_utils/app_styles.dart';
import 'package:smartpath/view/student_view/suffix_search_bar_button.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
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
                suffix: const SuffixSearchBarButton(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
