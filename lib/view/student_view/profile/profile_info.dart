// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/models/student_model/profile/profile_info_model.dart';
import 'package:smartpath/models/student_model/student_info_model.dart';
import 'package:smartpath/widgets/student/home/calendar/calendar_app_bar_widget.dart';
import 'package:smartpath/widgets/student/profile/card_info.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo({super.key});

  final StudentInfo studentInfo = Get.arguments;
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
        content: '${studentInfo.phoneNumber}',
        icon: LucideIcons.phone,
      ),
      ProfileInfoModel(
        title: 'class'.tr,
        content: '${studentInfo.className}',
        icon: LucideIcons.school2,
      ),
      ProfileInfoModel(
        title: 'status'.tr,
        content: studentInfo.expelled == 0 ? 'Active' : 'Expelled',
        icon: LucideIcons.shieldCheck,
      ),
      ProfileInfoModel(
        title: 'school'.tr,
        content: '${studentInfo.schoolGraduatedFrom}',
        icon: LucideIcons.school,
      ),
      ProfileInfoModel(
        title: 'rate'.tr,
        content: '${studentInfo.gpa} %',
        icon: LucideIcons.lineChart,
      ),
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Curve AppBar
          CalendarAppBarComponent(data: 'profile_info_title'.tr),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(radius: 50, child: Icon(LucideIcons.camera)),
                const Gap(25),
                Text(
                  '${studentInfo.name} ${studentInfo.lastName}',
                  style: AppStyles.styleBold24(),
                ),
                Cards(info: info),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
