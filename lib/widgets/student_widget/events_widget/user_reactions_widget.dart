// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/events_controller/all_reactions_controller.dart';

class UserReactions extends StatelessWidget {
  final AllReactionsController controller;
  const UserReactions({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.nowReactions!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              width: Get.width,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 7.5),
                leading: Container(
                  width: 35,
                  height: 35,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color:
                          controller.nowReactions![index].reactionType! ==
                              'love'
                          ? Colors.red[600]!
                          : controller.nowReactions![index].reactionType! ==
                                'like'
                          ? Colors.blue[600]!
                          : Colors.orange[600]!,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/${controller.nowReactions![index].reactionType!}.png',
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  '${controller.nowReactions![index].user!.name![0].toUpperCase()}${controller.nowReactions![index].user!.name!.substring(1)} ${controller.nowReactions![index].user!.middleName![0].toUpperCase()}${controller.nowReactions![index].user!.lastName![0].toUpperCase()}',
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const Gap(10),
    );
  }
}
