import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartpath/controller/student_controller/events/comments_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/student/events/custom_text_button_comment_page.dart';
import 'package:timeago/timeago.dart' as timeago;

class OptionWidget extends StatelessWidget {
  final CommentsController controller;
  final int index;
  const OptionWidget({
    super.key,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            timeago.format(
              DateTime.parse(controller.comments![index].createdAt.toString()),
              locale: 'en_short',
            ),
            style: AppStyles.styleRegular12().copyWith(color: Colors.black54),
          ),
          const Gap(10),
          CustomTextButtonCommentPage(title: 'Like', onPressed: () {}),
          const Gap(10),
          CustomTextButtonCommentPage(title: 'Reply', onPressed: () {}),
        ],
      ),
    );
  }
}
