import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartpath/controller/student_controller/events/events_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class RightSideWidget extends StatelessWidget {
  const RightSideWidget({
    super.key,
    required this.controller,
    required this.index,
  });

  final EventsController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          controller.events![index].commentNumber! > 0
              ? '${controller.events![index].commentNumber} Comments'
              : '',
          style: AppStyles.styleRegular12().copyWith(color: Colors.black87),
        ),
        const Gap(7.5),
        Text(
          '25 Shares',
          style: AppStyles.styleRegular12().copyWith(color: Colors.black87),
        ),
      ],
    );
  }
}
