// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/student_controller/events/comments_controller.dart';
import 'package:smartpath/controller/student_controller/events/delete_comments_controller.dart';
import 'package:smartpath/controller/student_controller/events/events_controller.dart';
import 'package:smartpath/controller/student_controller/events/type_operation_controller.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/replies_model.dart';
import 'package:smartpath/widgets/student/events/option_widget.dart';
import 'package:smartpath/widgets/student/events/options_on_comment_widget.dart';
import 'package:smartpath/widgets/student/events/reply_widget.dart';
import 'package:get/get.dart';

class CustomReply extends StatefulWidget {
  final int index;
  final int id;
  final List<Replies> replies;
  final CommentsController controller;
  final TextEditingController comment;
  final FocusNode commentFocus;
  final TypeOperation typeOperation;
  final EventsController events;
  final DeleteCommentsController deleteComment;
  const CustomReply({
    super.key,
    required this.index,
    required this.replies,
    required this.controller,
    required this.comment,
    required this.commentFocus,
    required this.typeOperation,
    required this.id,
    required this.events,
    required this.deleteComment,
  });

  @override
  State<CustomReply> createState() => _CustomReplyState();
}

class _CustomReplyState extends State<CustomReply> {
  List<bool> isExpanded = [];
  generate() {
    isExpanded = List.generate(
      widget.controller.comments![widget.index].replies!.length,
      (index) => false,
    );
  }

  @override
  void initState() {
    generate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(widget.replies.length, (index) {
        final reply = widget.replies[index];
        return IntrinsicHeight(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 25,
                  left: (Get.locale?.languageCode ?? 'en') == 'en' ? 25 : 0,
                  right: (Get.locale?.languageCode ?? 'en') == 'en' ? 0 : 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Content
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.indigo[100],
                        borderRadius: BorderRadius.circular(12.5),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12.5),
                        onLongPress: () async {
                          if (int.parse(prefs!.getString('user_id')!) ==
                              reply.userId) {
                            await widget.typeOperation.reDeclare();
                            await showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.only(
                                  topLeft: Radius.circular(12.5),
                                  topRight: Radius.circular(12.5),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return OptionsOnCommentWidget(
                                  commentFocus: widget.commentFocus,
                                  typeOperation: widget.typeOperation,
                                  comment: widget.comment,
                                  deleteComment: widget.deleteComment,
                                  id: widget.id,
                                  events: widget.events,
                                  index: index,
                                  commentId: reply.id!,
                                  content: reply.content!,
                                  controller: widget.controller,
                                  reply: reply,
                                );
                              },
                            );
                            if (widget.typeOperation.editComment ||
                                widget.typeOperation.editReply ||
                                widget.typeOperation.addReply) {
                              FocusScope.of(
                                context,
                              ).requestFocus(widget.commentFocus);
                            } else {
                              FocusScope.of(context).unfocus();
                            }
                          }
                        },
                        child: ReplyWidget(reply: reply),
                      ),
                    ),
                    // Options ::Must be edit
                    OptionWidget(
                      width: 120,
                      index: widget.index,
                      parentId: reply.id,
                      commentFocus: widget.commentFocus,
                      controller: widget.controller,
                      formattedString: reply.createdAt!,
                    ),
                    // ::Done
                    if (!isExpanded[index] &&
                        reply.replies != null &&
                        reply.replies!.isNotEmpty)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isExpanded[index] = true;
                          });
                        },
                        child: Text(
                          (Get.locale?.languageCode ?? 'en') == 'en'
                              ? '${'read_button'.tr} (${reply.replies!.length} ${'one_replies'.tr})'
                              : '${'read_button'.tr} (${reply.replies!.length == 1
                                  ? 'one_replies'.tr
                                  : reply.replies!.length == 2
                                  ? 'two_replies'.tr
                                  : reply.replies!.length > 2
                                  ? '${reply.replies!.length} ${'many_replies'.tr}'
                                  : ''})',
                          style: const TextStyle(color: Colors.indigo),
                        ),
                      ),
                    if (isExpanded[index] &&
                        reply.replies != null &&
                        reply.replies!.isNotEmpty)
                      CustomReply(
                        index: widget.index,
                        replies: reply.replies!,
                        controller: widget.controller,
                        comment: widget.comment,
                        commentFocus: widget.commentFocus,
                        deleteComment: widget.deleteComment,
                        events: widget.events,
                        id: widget.id,
                        typeOperation: widget.typeOperation,
                      ),
                  ],
                ),
              ),
              // image ::Done
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.indigo[100],
                  shape: BoxShape.circle,
                  border: Border.all(width: 8, color: Colors.indigo[50]!),
                ),
                child: const Icon(LucideIcons.user2, size: 15),
              ),
            ],
          ),
        );
      }),
    );
  }
}
