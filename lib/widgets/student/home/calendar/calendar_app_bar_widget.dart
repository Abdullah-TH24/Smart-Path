import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/student/profile/upper_waves.dart';

class CalendarAppBarComponent extends StatelessWidget {
  final String data;
  const CalendarAppBarComponent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 80,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          (Get.locale?.languageCode ?? 'en') == 'en'
              ? LucideIcons.chevronLeft
              : LucideIcons.chevronRight,
          color: Colors.indigo,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: const UpperWaves(),
        centerTitle: true,
        title: Text(
          data,
          style: AppStyles.styleMedium14().copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
