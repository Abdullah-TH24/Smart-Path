// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/student_controller/events/events_controller.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/student/events/custom_divider_widget.dart';
import 'package:smartpath/widgets/student/events/custom_text_button_widget.dart';
import 'package:smartpath/widgets/student/events/images_post_widget.dart';
import 'package:smartpath/widgets/student/events/post_content_widget.dart';
import 'package:smartpath/widgets/student/events/title_post_widget.dart';
import 'package:smartpath/widgets/student/home/calendar/calendar_app_bar_widget.dart';

class StudentEventsPage extends StatelessWidget {
  const StudentEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> reactions = [
      'assets/images/love.png',
      'assets/images/haha.png',
      'assets/images/like.png',
    ];
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
                                    // <Reactions>
                                    SizedBox(
                                      height: 25,
                                      width: 100,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: List.generate(
                                          reactions.length,
                                          (index) => Positioned(
                                            left: index * 15,
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundColor:
                                                  Colors.transparent,
                                              child: ClipOval(
                                                child: Image.asset(
                                                  reactions[index],
                                                  width: 20,
                                                  height: 20,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // <Comments, Share>
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // <Num Comments>
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
                                        // <Num Shares>
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
                                    CustomTextButton(
                                      title: 'Like',
                                      icon: Icons.thumb_up_alt_outlined,
                                      onPressed: () {},
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
