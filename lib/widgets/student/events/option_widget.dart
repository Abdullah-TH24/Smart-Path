// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/events/comments_controller.dart';
import 'package:smartpath/controller/student_controller/events/type_operation_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/widgets/student/events/custom_text_button_comment_page.dart';
import 'package:timeago/timeago.dart' as timeago;

class OptionWidget extends StatelessWidget {
  final double width;
  final int index;
  final int? parentId;
  final FocusNode commentFocus;
  final CommentsController controller;
  OptionWidget({
    super.key,
    required this.index,
    required this.width,
    this.parentId,
    required this.commentFocus,
    required this.controller,
  });

  TypeOperation typeOperation = Get.put(TypeOperation());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Time ::Done
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
          CustomTextButtonCommentPage(
            title: 'Reply',
            onPressed: () async {
              FocusScope.of(context).requestFocus(commentFocus);
              prefs!.setInt('parent_id', parentId!);
              typeOperation.changeAddReply(true);
            },
          ),
        ],
      ),
    );
  }
}
