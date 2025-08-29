import 'package:flutter/material.dart';
import 'package:smartpath/controller/student_controller/events_controller/all_reactions_controller.dart';
import 'package:smartpath/widgets/student_widget/events_widget/custom_button_for_all_widget.dart';
import 'package:smartpath/widgets/student_widget/events_widget/custom_button_for_any_widget.dart';

class CustomTabs extends StatelessWidget {
  final AllReactionsController controller;
  const CustomTabs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: List.generate(
            controller.reactionTypes.length + 1,
            (index) =>
                (index == 0)
                    ? CustomButtonForAll(controller: controller)
                    : CustomButtonForAny(controller: controller, index: index),
          ),
        ),
      ),
    );
  }
}
