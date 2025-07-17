// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/student_controller/events/add_comments_controller.dart';
import 'package:smartpath/controller/student_controller/events/comments_controller.dart';
import 'package:smartpath/controller/student_controller/events/delete_comments_controller.dart';
import 'package:smartpath/controller/student_controller/events/edit_comments_controller.dart';
import 'package:smartpath/controller/student_controller/events/events_controller.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/widgets/student/events/comment_field_widget.dart';
import 'package:smartpath/widgets/student/events/comment_widget.dart';
import 'package:smartpath/widgets/student/events/option_widget.dart';
import 'package:smartpath/widgets/student/home/calendar/calendar_app_bar_widget.dart';

class CommentsPage extends StatelessWidget {
  CommentsPage({super.key});
  int id = Get.arguments;
  AddCommentsController addComment = Get.put(AddCommentsController());
  final commentsController = Get.put(CommentsController(id: Get.arguments));
  EventsController events = Get.find();
  TextEditingController comment = TextEditingController();
  DeleteCommentsController deleteComment = Get.put(DeleteCommentsController());
  EditCommentsController editComment = Get.put(EditCommentsController());
  bool edit = false;
  int commentId = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarComponent(data: 'Comments'),
          SliverToBoxAdapter(
            child: GetBuilder<CommentsController>(
              init: CommentsController(id: id),
              builder: (controller) {
                return controller.isLoading
                    ? Container(
                      height: Get.height - 225,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        color: Colors.indigo,
                      ),
                    )
                    : (controller.errorMessage != null)
                    ? Container(
                      height: Get.height - 250,
                      alignment: Alignment.center,
                      child: Image.asset(AppAssets.noInternet),
                    )
                    : (controller.comments!.isEmpty)
                    ? Container(
                      height: Get.height - 225,
                      alignment: Alignment.center,
                      child: Image.asset(AppAssets.noData),
                    )
                    : Container(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 75,
                        left: 20,
                        right: 20,
                      ),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder:
                            (context, index) => IntrinsicHeight(
                              child: Stack(
                                children: [
                                  // Content
                                  Container(
                                    padding: const EdgeInsets.only(
                                      top: 25,
                                      left: 20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Comment
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 10,
                                            top: 10,
                                            bottom: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.indigo[100],
                                            borderRadius: BorderRadius.circular(
                                              12.5,
                                            ),
                                          ),
                                          child: InkWell(
                                            borderRadius: BorderRadius.circular(
                                              12.5,
                                            ),
                                            onDoubleTap: () async {
                                              final List indexes = [];
                                              for (
                                                var i = 0;
                                                i < controller.comments!.length;
                                                i++
                                              ) {
                                                if (controller
                                                        .comments![i]
                                                        .userId ==
                                                    int.parse(
                                                      prefs!.getString(
                                                        'user_id',
                                                      )!,
                                                    )) {
                                                  indexes.add(
                                                    controller.comments![i].id,
                                                  );
                                                }
                                              }
                                              if (indexes.contains(
                                                controller.comments![index].id,
                                              )) {
                                                await deleteComment
                                                    .deleteComment(
                                                      prefs!.getString(
                                                        'token',
                                                      )!,
                                                      controller
                                                          .comments![index]
                                                          .id!,
                                                    );
                                                if (deleteComment
                                                    .deleteCommentRes) {
                                                  commentsController
                                                      .getEventComments(
                                                        prefs!.getString(
                                                          'token',
                                                        )!,
                                                        id,
                                                      );
                                                  events.getAllPublishedEvents(
                                                    prefs!.getString('token')!,
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        'Please check your internet connection and try again',
                                                      ),
                                                    ),
                                                  );
                                                }
                                              }
                                            },
                                            onTap: () async {
                                              final List indexes = [];
                                              for (
                                                var i = 0;
                                                i < controller.comments!.length;
                                                i++
                                              ) {
                                                if (controller
                                                        .comments![i]
                                                        .userId ==
                                                    int.parse(
                                                      prefs!.getString(
                                                        'user_id',
                                                      )!,
                                                    )) {
                                                  indexes.add(
                                                    controller.comments![i].id,
                                                  );
                                                }
                                              }
                                              if (indexes.contains(
                                                controller.comments![index].id,
                                              )) {
                                                edit = true;
                                                commentId =
                                                    controller
                                                        .comments![index]
                                                        .id!;
                                                comment.text =
                                                    controller
                                                        .comments![index]
                                                        .content!;
                                              }
                                            },
                                            child: CommentWidget(
                                              controller: controller,
                                              index: index,
                                            ),
                                          ),
                                        ),
                                        // Options
                                        OptionWidget(
                                          controller: controller,
                                          index: index,
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Image
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.indigo[100],
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 8,
                                        color: Colors.indigo[50]!,
                                      ),
                                    ),
                                    child: const Icon(
                                      LucideIcons.user2,
                                      size: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        itemCount: controller.comments!.length,
                      ),
                    );
              },
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(10),
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.indigo[50],
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              color: Colors.black54,
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Field
            CommentField(comment: comment),
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
                  if (edit) {
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
                        events.getAllPublishedEvents(
                          prefs!.getString('token')!,
                        );
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
                  } else if (!edit) {
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
                        events.getAllPublishedEvents(
                          prefs!.getString('token')!,
                        );
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
                  edit = false;
                },
                icon: const Icon(Icons.send, color: Colors.black, size: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
