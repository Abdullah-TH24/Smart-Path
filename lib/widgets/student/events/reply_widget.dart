import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/models/student_model/comment_model.dart';

class ReplyWidget extends StatelessWidget {
  final Replies reply;
  const ReplyWidget({super.key, required this.reply});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${reply.name![0].toUpperCase()}${reply.name!.substring(1)} ${reply.middleName![0].toUpperCase()}${reply.lastName![0].toUpperCase()}',
          style: AppStyles.styleMedium14(),
        ),
        const Gap(5),
        Text(reply.content.toString(), style: AppStyles.styleRegular12()),
      ],
    );
  }
}
