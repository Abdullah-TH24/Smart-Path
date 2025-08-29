import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/student_controller/events_controller/events_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class TitlePost extends StatelessWidget {
  final EventsController controller;
  final int index;
  const TitlePost({super.key, required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.indigo[100],
            child: const Icon(LucideIcons.user2),
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${controller.events![index].publisherName!.split(' ')[0][0].toUpperCase()}${controller.events![index].publisherName!.split(' ')[0].substring(1)} ${controller.events![index].publisherName!.split(' ')[1][0].toUpperCase()}${controller.events![index].publisherName!.split(' ')[2][0].toUpperCase()}',
                style: AppStyles.styleMedium14(),
              ),
              Text(
                '${controller.events![index].eventName}',
                style: AppStyles.styleRegular12().copyWith(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
