import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:smartpath/widgets/student/home/calendar/app_bar_component.dart';
import 'package:smartpath/widgets/student/profile/button_contact_widget.dart';
import 'package:smartpath/widgets/student/profile/logo_with_app_name_widget.dart';
import 'package:smartpath/widgets/student/profile/text_contact_widget.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarComponent(data: 'page_title'.tr),
          // Logo With AppName
          const LogoWithAppName(),
          // Text Content
          const TextContactWidget(),
          // Buttons
          const ButtonContactWidget(),
        ],
      ),
    );
  }
}
