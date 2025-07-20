// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/student_controller/events/add_reaction_controller.dart';
import 'package:smartpath/controller/student_controller/events/events_controller.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/widgets/student/events/custom_divider_widget.dart';
import 'package:smartpath/widgets/student/events/custom_text_button_widget.dart';
import 'package:smartpath/widgets/student/events/images_post_widget.dart';
import 'package:smartpath/widgets/student/events/post_content_widget.dart';
import 'package:smartpath/widgets/student/events/reaction_overlay_widget.dart';
import 'package:smartpath/widgets/student/events/title_post_widget.dart';
import 'package:smartpath/widgets/student/home/calendar/app_bar_component.dart';

class StudentEventsPage extends StatelessWidget {
  const StudentEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AddReactionController addReaction = Get.put(AddReactionController());
    final Map<String, String> reactionImages = {
      "like": "assets/images/like.png",
      "love": "assets/images/love.png",
      "angry": "assets/images/angry.png",
      "sad": "assets/images/sad.png",
      "haha": "assets/images/haha.png",
      "wow": "assets/images/wow.png",
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
                              PostContent(controller: controller, index: index),
                              // <Images>
                              ImagesPost(controller: controller, index: index),
                              // Reactions
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // <Reactions + Number>
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                          AppRoutes.studentEventsReactionsInfo,
                                          arguments: {
                                            'reactableId':
                                                controller.events![index].id!,
                                            'reactableType': 'event',
                                          },
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final types =
                                                  controller
                                                      .events![index]
                                                      .reactions!
                                                      .types;
                                              final sortedReactions =
                                                  types.entries.toList()..sort(
                                                    (a, b) => b.value.compareTo(
                                                      a.value,
                                                    ),
                                                  );
                                              return SizedBox(
                                                height: 25,
                                                width:
                                                    (sortedReactions.length -
                                                            1) *
                                                        15 +
                                                    30,
                                                child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: List.generate(
                                                    sortedReactions.length,
                                                    (reactionIndex) {
                                                      final reactionType =
                                                          sortedReactions[reactionIndex]
                                                              .key
                                                              .toLowerCase();
                                                      return Positioned(
                                                        left:
                                                            reactionIndex * 15,
                                                        top: 2,
                                                        bottom: 2,
                                                        child: CircleAvatar(
                                                          radius: 15,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          child: ClipOval(
                                                            child: Image.asset(
                                                              reactionImages[reactionType] ??
                                                                  reactionImages["like"]!,
                                                              width: 20,
                                                              height: 20,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          Container(
                                            height: 25,
                                            alignment: Alignment.center,
                                            child: Text(
                                              (controller
                                                          .events![index]
                                                          .reactions!
                                                          .reactionNumber ==
                                                      0)
                                                  ? ''
                                                  : controller
                                                      .events![index]
                                                      .reactions!
                                                      .reactionNumber
                                                      .toString(),
                                              style: AppStyles.styleRegular12(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // <Comments, Share>
                                    Row(
                                      children: [
                                        Text(
                                          controller
                                                      .events![index]
                                                      .commentNumber! >
                                                  0
                                              ? '${controller.events![index].commentNumber} Comments'
                                              : '',
                                          style: AppStyles.styleRegular12()
                                              .copyWith(color: Colors.black87),
                                        ),
                                        const Gap(7.5),
                                        Text(
                                          '25 Shares',
                                          style: AppStyles.styleRegular12()
                                              .copyWith(color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // <Divider>
                              const CustomDivider(),
                              // <Like, Comment and Share> Buttons
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Row(
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
                                            reaction.text,
                                            style: TextStyle(
                                              color: reaction.color,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // <Comments> Button
                                    CustomTextButton(
                                      title: 'Comment',
                                      icon: Icons.mode_comment_outlined,
                                      onPressed: () {
                                        Get.toNamed(
                                          AppRoutes.studentEventsComments,
                                          arguments:
                                              controller.events![index].id,
                                        );
                                      },
                                    ),
                                    // <Share> Button
                                    CustomTextButton(
                                      title: 'Share',
                                      icon: LucideIcons.share2,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder:
                          (context, index) =>
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
