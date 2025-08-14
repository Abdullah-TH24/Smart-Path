// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/localization_controller/localization_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/models/student_model/profile/profile_info_model.dart';
import 'package:smartpath/models/student_model/student_info_model.dart';
import 'package:smartpath/widgets/student/home/calendar/app_bar_component.dart';
import 'package:smartpath/widgets/student/profile/card_info_component.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo({super.key});

  final StudentModel studentInfo = Get.arguments;
  LocalizationController locale = Get.find();

  @override
  Widget build(BuildContext context) {
    final List<ProfileInfoModel> info = [
      ProfileInfoModel(
        title: 'email'.tr,
        content: '${studentInfo.email}',
        icon: LucideIcons.mail,
      ),
      ProfileInfoModel(
        title: 'phone'.tr,
        content: '${studentInfo.phone}',
        icon: LucideIcons.phone,
      ),
      ProfileInfoModel(
        title: 'class'.tr,
        content: '${studentInfo.profileData!.className}',
        icon: LucideIcons.school2,
      ),
      ProfileInfoModel(
        title: 'rate'.tr,
        content: '${studentInfo.profileData!.gpa} %',
        icon: LucideIcons.lineChart,
      ),
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Curve AppBar
          AppBarComponent(data: 'profile_info_title'.tr),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.indigo[100],
                  child: const Icon(LucideIcons.camera),
                ),
                const Gap(25),
                Text(
                  '${studentInfo.fullName!.split(' ')[0][0].toUpperCase()}${studentInfo.fullName!.split(' ')[0].substring(1)} ${studentInfo.fullName!.split(' ')[2][0].toUpperCase()}${studentInfo.fullName!.split(' ')[2].substring(1)}',
                  style: AppStyles.styleBold24(),
                ),
                Cards(info: info),
                const Gap(100),
                ElevatedButton(
                  onPressed: () {
                    // studentInfo.profileData!.shoolGraduatedFrom
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12.5),
                    ),
                  ),
                  child: const Text('Download Certificate'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
