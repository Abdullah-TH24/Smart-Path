// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/student_controller/events/add_comments_controller.dart';
import 'package:smartpath/controller/student_controller/events/comments_controller.dart';
import 'package:smartpath/controller/student_controller/events/delete_comments_controller.dart';
import 'package:smartpath/controller/student_controller/events/edit_comments_controller.dart';
import 'package:smartpath/controller/student_controller/events/events_controller.dart';
import 'package:smartpath/controller/student_controller/events/type_operation_controller.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/widgets/student/events/comment_widget.dart';
import 'package:smartpath/widgets/student/events/custom_input_with_button_widget.dart';
import 'package:smartpath/widgets/student/events/custom_reply_widget.dart';
import 'package:smartpath/widgets/student/events/option_widget.dart';
import 'package:smartpath/widgets/student/events/options_on_comment_widget.dart';
import 'package:smartpath/widgets/student/home/calendar/app_bar_component.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  int id = Get.arguments;

  AddCommentsController addComment = Get.put(AddCommentsController());

  final CommentsController commentsController = Get.put(
    CommentsController(id: Get.arguments),
  );

  EventsController events = Get.find();

  TextEditingController comment = TextEditingController();

  FocusNode commentFocus = FocusNode();

  DeleteCommentsController deleteComment = Get.put(DeleteCommentsController());

  EditCommentsController editComment = Get.put(EditCommentsController());

  TypeOperation typeOperation = Get.put(TypeOperation());

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarComponent(data: 'comment_title_page'.tr),
          SliverToBoxAdapter(
            child: GetBuilder<CommentsController>(
              init: CommentsController(id: id),
              builder: (controller) {
                return controller.isLoading
                    ? Container(
                      height: Get.height - 225,
                      alignment: Alignment.center,
                      child: const SpinKitSpinningLines(color: Colors.indigo),
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
                                    padding: EdgeInsets.only(
                                      top: 25,
                                      right:
                                          (Get.locale?.languageCode ?? 'en') ==
                                                  'en'
                                              ? 0
                                              : 20,
                                      left:
                                          (Get.locale?.languageCode ?? 'en') ==
                                                  'en'
                                              ? 20
                                              : 0,
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
                                          padding: EdgeInsets.only(
                                            left:
                                                (Get.locale?.languageCode ??
                                                            'en') ==
                                                        'en'
                                                    ? 20
                                                    : 10,
                                            right:
                                                (Get.locale?.languageCode ??
                                                            'en') ==
                                                        'en'
                                                    ? 10
                                                    : 20,
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
                                            onLongPress: () async {
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
                                                await typeOperation.reDeclare();
                                                await showModalBottomSheet(
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadiusGeometry.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                12.5,
                                                              ),
                                                          topRight:
                                                              Radius.circular(
                                                                12.5,
                                                              ),
                                                        ),
                                                  ),
                                                  context: context,
                                                  builder: (context) {
                                                    return OptionsOnCommentWidget(
                                                      commentFocus:
                                                          commentFocus,
                                                      typeOperation:
                                                          typeOperation,
                                                      comment: comment,
                                                      deleteComment:
                                                          deleteComment,
                                                      id: id,
                                                      events: events,
                                                      index: index,
                                                      controller: controller,
                                                      commentId:
                                                          controller
                                                              .comments![index]
                                                              .id!,
                                                      content:
                                                          controller
                                                              .comments![index]
                                                              .content!,
                                                    );
                                                  },
                                                );
                                                if (typeOperation.editComment ||
                                                    typeOperation.editReply) {
                                                  FocusScope.of(
                                                    context,
                                                  ).requestFocus(commentFocus);
                                                } else {
                                                  FocusScope.of(
                                                    context,
                                                  ).unfocus();
                                                }
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
                                          width: 140,
                                          index: index,
                                          parentId:
                                              controller.comments![index].id,
                                          commentFocus: commentFocus,
                                          controller: controller,
                                          formattedString:
                                              controller
                                                  .comments![index]
                                                  .createdAt!,
                                        ),
                                        // Read more
                                        if (!controller.isExpanded[index] &&
                                            controller
                                                    .comments![index]
                                                    .replies !=
                                                null &&
                                            controller
                                                .comments![index]
                                                .replies!
                                                .isNotEmpty)
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                controller
                                                    .changeValueToExpanded(
                                                      index,
                                                      true,
                                                    );
                                              });
                                            },
                                            child: Text(
                                              (Get.locale?.languageCode ??
                                                          'en') ==
                                                      'en'
                                                  ? '${'read_button'.tr} (${controller.comments![index].replies!.length} ${'one_replies'.tr})'
                                                  : '${'read_button'.tr} (${controller.comments![index].replies!.length == 1
                                                      ? 'one_replies'.tr
                                                      : controller.comments![index].replies!.length == 2
                                                      ? 'two_replies'.tr
                                                      : controller.comments![index].replies!.length > 2
                                                      ? '${controller.comments![index].replies!.length} ${'many_replies'.tr}'
                                                      : ''})',
                                              style: const TextStyle(
                                                color: Colors.indigo,
                                              ),
                                            ),
                                          ),
                                        // Nested Replies
                                        if (controller
                                                    .comments![index]
                                                    .replies !=
                                                null &&
                                            controller
                                                .comments![index]
                                                .replies!
                                                .isNotEmpty &&
                                            controller.isExpanded[index])
                                          CustomReply(
                                            index: index,
                                            replies:
                                                controller
                                                    .comments![index]
                                                    .replies!,
                                            controller: controller,
                                            comment: comment,
                                            commentFocus: commentFocus,
                                            deleteComment: deleteComment,
                                            events: events,
                                            id: id,
                                            typeOperation: typeOperation,
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
      // Field With Button <Send>
      bottomSheet: GetBuilder<TypeOperation>(
        builder: (typeOperation) {
          return CustomInputWithButton(
            comment: comment,
            commentFocus: commentFocus,
            addComment: addComment,
            editComment: editComment,
            typeOperation: typeOperation,
            events: events,
            commentsController: commentsController,
            id: id,
            commentId: typeOperation.commentId,
          );
        },
      ),
    );
  }
}
