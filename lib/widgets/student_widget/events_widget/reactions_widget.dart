import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/events_controller/events_controller.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/student_widget/events_widget/rigth_side_widget.dart';

class ReactionsWidget extends StatelessWidget {
  final EventsController controller;
  final int index;
  const ReactionsWidget({
    super.key,
    required this.reactionImages,
    required this.controller,
    required this.index,
  });

  final Map<String, String> reactionImages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // <Reactions + Number>
          InkWell(
            onTap: () {
              Get.toNamed(
                AppRoutes.studentEventsReactionsInfo,
                arguments: {
                  'reactableId': controller.events![index].id!,
                  'reactableType': 'event',
                },
              );
            },
            child: SizedBox(
              width:
                  controller.events![index].reactions!.reactionNumber == 0
                      ? 50
                      : null,
              child: Row(
                children: [
                  Builder(
                    builder: (context) {
                      final types = controller.events![index].reactions!.types;
                      final sortedReactions =
                          types.entries.toList()
                            ..sort((a, b) => b.value.compareTo(a.value));
                      return SizedBox(
                        height: 25,
                        width: (sortedReactions.length - 1) * 15 + 30,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: List.generate(sortedReactions.length, (
                            reactionIndex,
                          ) {
                            final reactionType =
                                sortedReactions[reactionIndex].key
                                    .toLowerCase();
                            return Positioned(
                              left: reactionIndex * 15,
                              top: 2,
                              bottom: 2,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.transparent,
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
                          }),
                        ),
                      );
                    },
                  ),
                  Container(
                    height: 25,
                    alignment: Alignment.center,
                    child: Text(
                      (controller.events![index].reactions!.reactionNumber == 0)
                          ? ''
                          : controller.events![index].reactions!.reactionNumber
                              .toString(),
                      style: AppStyles.styleRegular12(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // <Comments, Share>
          RightSideWidget(controller: controller, index: index),
        ],
      ),
    );
  }
}
