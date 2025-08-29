import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:smartpath/controller/student_controller/events_controller/all_reactions_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class CustomButtonForAny extends StatelessWidget {
  final AllReactionsController controller;
  final int index;
  const CustomButtonForAny({
    super.key,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        controller.changeTabIndex(
          index,
          controller.reactionTypes.elementAt(index - 1),
        );
      },
      child: Container(
        width: 100,
        height: 40,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color:
              controller.tabIndex == index &&
                  controller.reactionTypes.elementAt(index - 1) == 'like'
              ? Colors.blue[600]!
              : controller.tabIndex == index &&
                    controller.reactionTypes.elementAt(index - 1) == 'love'
              ? Colors.red[600]!
              : (controller.tabIndex == index)
              ? Colors.orange[600]!
              : Colors.transparent,
          border: Border.all(
            width: 1,
            color: controller.reactionTypes.elementAt(index - 1) == 'like'
                ? Colors.blue[600]!
                : controller.reactionTypes.elementAt(index - 1) == 'love'
                ? Colors.red[600]!
                : Colors.orange[600]!,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Center(
          child: Text(
            '${controller.reactionTypes.elementAt(index - 1)[0].toUpperCase()}${controller.reactionTypes.elementAt(index - 1).substring(1)}'
                .tr,
            style: AppStyles.styleRegular16().copyWith(
              color: controller.tabIndex == index
                  ? Colors.indigo[50]
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
