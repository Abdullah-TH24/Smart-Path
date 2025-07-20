import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/events/all_reactions_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class UserReactions extends StatelessWidget {
  final AllReactionsController controller;
  const UserReactions({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.users.length,
      itemBuilder:
          (context, index) => SizedBox(
            width: Get.width,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 7.5),
              leading: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(2.5),
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
              subtitle: Text(
                '${controller.users[index].email}',
                style: AppStyles.styleRegular12(),
              ),
            ),
          ),
      separatorBuilder: (context, index) => const Gap(10),
    );
  }
}
