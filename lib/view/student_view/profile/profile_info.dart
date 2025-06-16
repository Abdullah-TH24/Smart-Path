// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/core/utils/general_utils/app_styles.dart';
import 'package:smartpath/models/student_model/profile/profile_info_model.dart';
import 'package:smartpath/widgets/student/profile/grid_info.dart';
import 'package:smartpath/widgets/student/profile/upper_waves.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo({super.key});

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
          SliverAppBar(
            pinned: true,
            expandedHeight: 80,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                locale.initailLang == const Locale('en') ||
                        locale.initailLang == Get.deviceLocale
                    ? LucideIcons.chevronLeft
                    : LucideIcons.chevronRight,
                color: Colors.indigo,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: const UpperWaves(),
              titlePadding: const EdgeInsets.only(
                left: 16,
                bottom: 8,
                right: 16,
              ),
              title: Text(
                'profile-info-title'.tr,
                style: AppStyles.styleMedium14().copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(radius: 50, child: Icon(LucideIcons.camera)),
                const Gap(25),
                Text('Abdullah Hamid', style: AppStyles.styleBold24()),
                const Gap(25),
                GridInfo(info: info),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
