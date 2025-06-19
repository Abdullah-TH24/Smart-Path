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
  final List<ProfileInfoModel> info = [
    // TODO put info the get from login api and store it in shared preference
    ProfileInfoModel(title: 'class'.tr, content: '10 / 8'),
    ProfileInfoModel(title: 'status'.tr, content: 'Active'),
    ProfileInfoModel(title: 'school'.tr, content: 'Al saada'),
    ProfileInfoModel(title: 'rate'.tr, content: '0 %'),
    ProfileInfoModel(title: 'email'.tr, content: 'example@gmail.com'),
    ProfileInfoModel(title: 'phone'.tr, content: '+963 981 793 954'),
    ProfileInfoModel(title: 'address'.tr, content: 'Damascus Bet sahem'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Curve AppBar
          CalendarAppBarComponent(data: 'profile-info-title'.tr),
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
                Cards(info: info, studentInfo: studentInfo),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
