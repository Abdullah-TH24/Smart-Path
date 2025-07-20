import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:smartpath/widgets/student/home/calendar/app_bar_component.dart';
import 'package:smartpath/widgets/student/profile/logo_with_app_name_widget.dart';
import 'package:smartpath/widgets/student/profile/text_about_widget.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarComponent(data: 'page_title_about'.tr),
          // Logo With AppName
          const LogoWithAppName(),
          // Text Content
          const TextAboutWidget(),
        ],
      ),
    );
  }
}
