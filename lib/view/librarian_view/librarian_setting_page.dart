// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/view/librarian_view/widgets/lib_select_lang.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_wave_app_bar.dart';

class LibrarianSettingPage extends StatefulWidget {
  const LibrarianSettingPage({super.key});

  @override
  State<LibrarianSettingPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<LibrarianSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          LibrarianWaveAppBar(title: 'Settings'.tr),
          // Select Language
          const SliverToBoxAdapter(child: LibSelectLang()),
          // Divider
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Divider(color: Color(0xffA0A0A0)),
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
                  color: Color(0xffA0A0A0),
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
