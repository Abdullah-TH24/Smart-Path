import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/events/all_reactions_controller.dart';

class UserReactions extends StatelessWidget {
  final AllReactionsController controller;
  const UserReactions({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    String currentReaction = '';
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.users.length,
      itemBuilder: (context, index) {
        currentReaction = controller.reactionImages[index];
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
                          controller.reactionImages[index]
                                      .toString()
                                      .toLowerCase() ==
                                  'love'
                              ? Colors.red[600]!
                              : controller.reactionImages[index]
                                      .toString()
                                      .toLowerCase() ==
                                  'like'
                              ? Colors.blue[600]!
                              : Colors.orange[600]!,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/${controller.reactionImages[index].toString().toLowerCase()}.png',
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  '${controller.users[index].name![0].toUpperCase()}${controller.users[index].name!.substring(1)} ${controller.users[index].middleName![0].toUpperCase()}${controller.users[index].lastName![0].toUpperCase()}',
                ),
              ),
            ),
            (index != controller.users.length - 1 &&
                    currentReaction != controller.reactionImages[index + 1])
                ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(),
                )
                : const SizedBox(),
          ],
        );
      },
      separatorBuilder: (context, index) => const Gap(10),
    );
  }
}
