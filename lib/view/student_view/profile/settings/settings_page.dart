// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/widgets/student/home/calendar/calendar_app_bar_widget.dart';
import 'package:smartpath/widgets/student/profile/settings/select_language_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarComponent(data: 'Settings'.tr),
          // Select Language
          const SliverToBoxAdapter(child: SelectLanguage()),
          // Divider
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Divider(color: Colors.black54),
            ),
          ),
          // Enable Biometric Auth
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                onTap: () {
                  if (prefs!.getString('pin_code') != null) {
                    Get.toNamed(AppRoutes.studentProfileVerfiyPin);
                  } else {
                    Get.toNamed(AppRoutes.studentProfileEnterPIN);
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12.5),
                ),
                title: Text('Lock App'.tr),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.indigo,
                ),
              ),
            ),
          ),
          // Divider
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Divider(color: Colors.black54),
            ),
          ),
          // Change Password
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                onTap: () {
                  Get.toNamed(AppRoutes.requestResetPassword);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12.5),
                ),
                title: Text('change_password'.tr),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.indigo,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
