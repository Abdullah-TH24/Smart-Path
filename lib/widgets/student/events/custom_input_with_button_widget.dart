// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/events/add_comments_controller.dart';
import 'package:smartpath/controller/student_controller/events/comments_controller.dart';
import 'package:smartpath/controller/student_controller/events/edit_comments_controller.dart';
import 'package:smartpath/controller/student_controller/events/events_controller.dart';
import 'package:smartpath/controller/student_controller/events/type_operation_controller.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/widgets/student/events/comment_field_widget.dart';

class CustomInputWithButton extends StatelessWidget {
  final TextEditingController comment;
  final FocusNode commentFocus;
  final AddCommentsController addComment;
  final EditCommentsController editComment;
  final TypeOperation typeOperation;
  final EventsController events;
  final CommentsController commentsController;
  final int id;
  final int commentId;
  const CustomInputWithButton({
    super.key,
    required this.comment,
    required this.commentFocus,
    required this.addComment,
    required this.editComment,
    required this.typeOperation,
    required this.events,
    required this.commentsController,
    required this.id,
    required this.commentId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.indigo[50],
        boxShadow: const [
          BoxShadow(offset: Offset(0, 0), color: Colors.black54, blurRadius: 2),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Field
          CommentField(comment: comment, commentFocus: commentFocus),
          // Button
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.indigo[100],
            ),
            child: IconButton(
              onPressed: () async {
                if (typeOperation.editComment) {
                  if (comment.text.isNotEmpty) {
                    FocusScope.of(context).unfocus();
                    await editComment.editComment(
                      prefs!.getString('token')!,
                      commentId,
                      comment.text.trim(),
                    );
                    comment.clear();
                    if (editComment.editCommentRes) {
                      commentsController.getEventComments(
                        prefs!.getString('token')!,
                        id,
                      );
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
                  }
                } else if (typeOperation.addComment) {
                  if (comment.text.isNotEmpty) {
                    FocusScope.of(context).unfocus();
                    await addComment.addComment(
                      prefs!.getString('token')!,
                      id,
                      comment.text.trim(),
                      null,
                    );
                    comment.clear();
                    if (addComment.addCommentRes) {
                      commentsController.getEventComments(
                        prefs!.getString('token')!,
                        id,
                      );
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
                  }
                } else if (typeOperation.addReply) {
                  if (comment.text.isNotEmpty) {
                    FocusScope.of(context).unfocus();
                    await addComment.addComment(
                      prefs!.getString('token')!,
                      id,
                      comment.text.trim(),
                      prefs!.getInt('parent_id'),
                    );
                    comment.clear();
                    if (addComment.addCommentRes) {
                      commentsController.getEventComments(
                        prefs!.getString('token')!,
                        id,
                      );
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
                  }
                }
                typeOperation.reDeclare();
              },
              icon: const Icon(Icons.send, color: Colors.black, size: 25),
            ),
          ),
        ],
      ),
    );
  }
}
