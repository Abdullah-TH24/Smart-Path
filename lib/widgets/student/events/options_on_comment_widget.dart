// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/events/comments_controller.dart';
import 'package:smartpath/controller/student_controller/events/delete_all_related_comment_controller.dart';
import 'package:smartpath/controller/student_controller/events/delete_comments_controller.dart';
import 'package:smartpath/controller/student_controller/events/events_controller.dart';
import 'package:smartpath/controller/student_controller/events/type_operation_controller.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/replies_model.dart';

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
  const OptionsOnCommentWidget({
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
            child: const Text('Edit Comment'),
          ),
          const Gap(10),
          // Repert Comment
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12.5),
              ),
            ),
            child: const Text('Report Comment'),
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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Please check your internet connection and try again',
                    ),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12.5),
              ),
            ),
            child: const Text('Delete Comment'),
          ),
        ],
      ),
    );
  }
}
