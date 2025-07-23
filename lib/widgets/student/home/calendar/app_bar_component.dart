import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/student/profile/upper_waves_component.dart';

class AppBarComponent extends StatelessWidget {
  final String data;
  final bool? enableLeading;
  const AppBarComponent({
    super.key,
    required this.data,
    this.enableLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 80,
      leading:
          (enableLeading!)
              ? IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  (Get.locale?.languageCode ?? 'en') == 'en'
                      ? LucideIcons.chevronLeft
                      : LucideIcons.chevronRight,
                  color: Colors.indigo,
                ),
              )
              : null,
      flexibleSpace: FlexibleSpaceBar(
        background: UpperWaves(),
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
