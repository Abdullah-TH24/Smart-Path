import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:smartpath/controller/student_controller/events_controller/all_reactions_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class CustomButtonForAll extends StatelessWidget {
  final AllReactionsController controller;
  const CustomButtonForAll({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        controller.changeTabIndex(0,'all');
      },
      child: Container(
        width: 60,
        height: 40,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: controller.tabIndex == 0 ? Colors.indigo : Colors.transparent,
          border: Border.all(width: 1, color: Colors.indigo),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Center(
          child: Text(
            'all_button'.tr,
            style: AppStyles.styleRegular16().copyWith(
              color:
                  controller.tabIndex == 0 ? Colors.indigo[50] : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
