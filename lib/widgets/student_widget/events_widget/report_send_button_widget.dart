// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/events_controller/report_comment_controller.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/view/librarian_view/utils/show_snackbar.dart';

class ReportSendButton extends StatelessWidget {
  ReportSendButton({
    super.key,
    required this.form,
    required this.report,
    required this.commentId,
    required this.reportMsg,
  });

  final GlobalKey<FormState> form;
  final ReportCommentController report;
  final int commentId;
  final TextEditingController reportMsg;
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (!clicked) {
          clicked = true;
          if (form.currentState!.validate()) {
            FocusScope.of(context).unfocus();
            await report.reportComment(
              prefs!.getString('token')!,
              commentId.toString(),
              reportMsg.text.trim(),
            );
            Get.close(1);
            if (report.result != null) {
              showSnackbar('Done'.tr, report.result!);
            } else if (report.errorMessage != null) {
              showSnackbar('Error'.tr, report.errorMessage!);
            }
          }
          clicked = false;
        }
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.5),
        ),
      ),
      child: Text('send'.tr),
    );
  }
}
