import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartpath/controller/student_controller/events/comments_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class CommentWidget extends StatelessWidget {
  final CommentsController controller;
  final int index;
  const CommentWidget({
    super.key,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${controller.comments![index].name![0].toUpperCase()}${controller.comments![index].name!.substring(1)} ${controller.comments![index].middleName![0].toUpperCase()}${controller.comments![index].lastName![0].toUpperCase()}',
          style: AppStyles.styleMedium14(),
        ),
        const Gap(5),
        Text(
          controller.comments![index].content.toString(),
          style: AppStyles.styleRegular12(),
        ),
      ],
    );
  }
}
