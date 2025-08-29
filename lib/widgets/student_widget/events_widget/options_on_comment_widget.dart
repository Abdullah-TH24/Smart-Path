// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/events_controller/comments_controller.dart';
import 'package:smartpath/controller/student_controller/events_controller/delete_all_related_comment_controller.dart';
import 'package:smartpath/controller/student_controller/events_controller/delete_comments_controller.dart';
import 'package:smartpath/controller/student_controller/events_controller/events_controller.dart';
import 'package:smartpath/controller/student_controller/events_controller/report_comment_controller.dart';
import 'package:smartpath/controller/student_controller/events_controller/type_operation_controller.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/replies_model.dart';
import 'package:smartpath/view/librarian_view/utils/show_snackbar.dart';
import 'package:smartpath/widgets/student_widget/events_widget/report_send_button_widget.dart';

class OptionsOnCommentWidget extends StatelessWidget {
  final FocusNode commentFocus;
  final TypeOperation typeOperation;
  final TextEditingController comment;
  final DeleteCommentsController deleteComment;
  final int id;
  final EventsController events;
  final String content;
  final int index;
  final int commentId;
  final Replies? reply;
  final CommentsController controller;
  OptionsOnCommentWidget({
    super.key,
    required this.commentFocus,
    required this.typeOperation,
    required this.comment,
    required this.deleteComment,
    required this.id,
    required this.events,
    required this.index,
    required this.commentId,
    required this.content,
    required this.controller,
    this.reply,
  });

  ReportCommentController report = Get.put(ReportCommentController());
  GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController reportMsg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Edit Comment ::Done
          ElevatedButton(
            onPressed: () async {
              Get.close(1);
              typeOperation.changeEditComment(true);
              typeOperation.changeCommentId(commentId);
              comment.text = content;
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12.5),
              ),
            ),
            child: Text('edit_button'.tr),
          ),
          const Gap(10),
          // Repert Comment
          ElevatedButton(
            onPressed: () async {
              bool clicked = false;
              final List<String> msg = [
                'report_msg_1'.tr,
                'report_msg_2'.tr,
                'report_msg_3'.tr,
                'report_msg_4'.tr,
                'report_msg_5'.tr,
                'report_msg_6'.tr,
              ];
              Get.close(1);
              await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.5),
                ),
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...List.generate(
                              6,
                              (index) => ElevatedButton(
                                onPressed: () async {
                                  if (!clicked) {
                                    clicked = true;
                                    await report.reportComment(
                                      prefs!.getString('token')!,
                                      commentId.toString(),
                                      msg[index],
                                    );
                                    Get.close(1);
                                    if (report.result != null) {
                                      showSnackbar('Done'.tr, report.result!);
                                    } else if (report.errorMessage != null) {
                                      showSnackbar(
                                        'Error'.tr,
                                        report.errorMessage!,
                                      );
                                    }
                                    clicked = false;
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.5),
                                  ),
                                ),
                                child: Text(msg[index]),
                              ),
                            ),
                            Form(
                              key: form,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'report_hint'.tr,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'report_msg_error'.tr;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            ReportSendButton(
                              form: form,
                              report: report,
                              commentId: commentId,
                              reportMsg: reportMsg,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12.5),
              ),
            ),
            child: Text('report_button'.tr),
          ),
          const Gap(10),
          // Delete Comment ::Done
          ElevatedButton(
            onPressed: () async {
              Get.close(1);
              typeOperation.reDeclare();
              if (reply != null) {
                if (reply!.replies != null) {
                  await deleteAllCommentRelated(reply!.replies!, deleteComment);
                }
              } else {
                if (controller.comments?[index].replies! != null) {
                  await deleteAllCommentRelated(
                    controller.comments![index].replies!,
                    deleteComment,
                  );
                }
              }
              await deleteComment.deleteComment(
                prefs!.getString('token')!,
                commentId,
              );
              if (deleteComment.deleteCommentRes) {
                controller.getEventComments(prefs!.getString('token')!, id);
                events.getAllPublishedEvents(prefs!.getString('token')!);
              } else {
                showSnackbar('Error'.tr, 'comment_error'.tr);
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12.5),
              ),
            ),
            child: Text('delete_button'.tr),
          ),
        ],
      ),
    );
  }
}
