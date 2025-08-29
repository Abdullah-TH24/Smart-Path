// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/student_controller/events_controller/add_reaction_controller.dart';
import 'package:smartpath/controller/student_controller/events_controller/events_controller.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/widgets/student_widget/events_widget/custom_divider_widget.dart';
import 'package:smartpath/widgets/student_widget/events_widget/custom_text_button_widget.dart';
import 'package:smartpath/widgets/student_widget/events_widget/images_post_widget.dart';
import 'package:smartpath/widgets/student_widget/events_widget/post_content_widget.dart';
import 'package:smartpath/widgets/student_widget/events_widget/reaction_overlay_widget.dart';
import 'package:smartpath/widgets/student_widget/events_widget/reactions_widget.dart';
import 'package:smartpath/widgets/student_widget/events_widget/title_post_widget.dart';
import 'package:smartpath/widgets/student_widget/home_widget/calendar_widget/app_bar_component.dart';
import 'package:share_plus/share_plus.dart';

class StudentEventsPage extends StatelessWidget {
  const StudentEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AddReactionController addReaction = Get.put(AddReactionController());
    final Map<String, String> reactionImages = {
      'like': 'assets/images/like.png',
      'love': 'assets/images/love.png',
      'angry': 'assets/images/angry.png',
      'sad': 'assets/images/sad.png',
      'haha': 'assets/images/haha.png',
      'wow': 'assets/images/wow.png',
    };
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarComponent(data: 'grid_item_name_7'.tr, enableLeading: false),
          SliverToBoxAdapter(
            child: GetBuilder<EventsController>(
              init: EventsController(),
              builder: (controller) {
                return (controller.isLoading)
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
                    : (controller.events!.isEmpty)
                    ? Container(
                        height: Get.height - 225,
                        alignment: Alignment.center,
                        child: Image.asset(AppAssets.noData),
                      )
                    : ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final reaction = controller.getReaction(
                            controller.events![index].id!,
                          );
                          return SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // <Image, Name::Title>
                                TitlePost(controller: controller, index: index),
                                // <Post Content>
                                PostContent(
                                  controller: controller,
                                  index: index,
                                ),
                                // <Images>
                                controller.events![index].media!.isNotEmpty
                                    ? ImagesPost(
                                        controller: controller,
                                        index: index,
                                      )
                                    : Container(),
                                // Reactions
                                ReactionsWidget(
                                  reactionImages: reactionImages,
                                  controller: controller,
                                  index: index,
                                ),
                                // <Divider>
                                const CustomDivider(),
                                // <Like, Comment and Share> Buttons
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // <Like> Button
                                    GestureDetector(
                                      onLongPressStart: (details) {
                                        ReactionOverlay.showReactions(
                                          context,
                                          details.globalPosition,
                                          (reactionType) async {
                                            await addReaction.addReaction(
                                              prefs!.getString('token')!,
                                              reactionType,
                                              controller.events![index].id!,
                                              'event',
                                            );
                                            if (addReaction.addReactRes) {
                                              controller.setReact(
                                                controller.events![index].id!,
                                                reactionType,
                                                'assets/images/${reactionType.toLowerCase()}.png',
                                                reactionType == 'like'
                                                    ? Colors.blue[600]!
                                                    : reactionType == 'love'
                                                    ? Colors.red[600]!
                                                    : Colors.yellow[900]!,
                                              );
                                            }
                                          },
                                        );
                                      },
                                      onTap: () async {
                                        await addReaction.addReaction(
                                          prefs!.getString('token')!,
                                          'like',
                                          controller.events![index].id!,
                                          'event',
                                        );
                                        if (addReaction.addReactRes) {
                                          controller.setReact(
                                            controller.events![index].id!,
                                            'like',
                                            'assets/images/like.png',
                                            Colors.blue[600]!,
                                          );
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 5,
                                          horizontal: 10,
                                        ),
                                        child: Row(
                                          children: [
                                            (reaction.image != null)
                                                ? Image.asset(
                                                    reaction.image!,
                                                    width: 20,
                                                  )
                                                : const Icon(
                                                    Icons.thumb_up_outlined,
                                                    color: Colors.black87,
                                                    size: 20,
                                                  ),
                                            const Gap(10),
                                            Text(
                                              '${reaction.text[0].toUpperCase()}${reaction.text.substring(1)}'
                                                  .tr,
                                              style: TextStyle(
                                                color: reaction.color,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // <Comments> Button
                                    CustomTextButton(
                                      title: 'comment_button'.tr,
                                      icon: Icons.mode_comment_outlined,
                                      onPressed: () {
                                        Get.toNamed(
                                          AppRoutes.studentEventsComments,
                                          arguments:
                                              controller.events![index].id,
                                        );
                                      },
                                    ),
                                    // <Share> Button ::This Only
                                    ShareWidget(
                                      title:
                                          controller.events![index].eventName!,
                                      content: controller.events![index].post!,
                                      postId: controller.events![index].id!,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            Container(height: 10, color: Colors.indigo[100]),
                        itemCount: controller.events!.length,
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ShareWidget extends StatelessWidget {
  final String title;
  final String content;
  final int postId;
  const ShareWidget({
    super.key,
    required this.title,
    required this.content,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      title: 'share_button'.tr,
      icon: LucideIcons.share2,
      onPressed: () async {
        try {
          const String baseUrl = 'https://127.0.0.1:8000';
          // final String postUrl = '$baseUrl/$postId';
          // final text = '$title\n\n$content\n\n🔗 $postUrl';
          final text = '$title\n\n$content';

          await SharePlus.instance.share(ShareParams(text: text, title: title));
        } catch (e) {
          log('Catch-> $e');
        }
      },
    );
  }
}
