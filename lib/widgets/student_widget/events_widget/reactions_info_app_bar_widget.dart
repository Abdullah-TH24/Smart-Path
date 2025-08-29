import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/widgets/student_widget/profile_widget/upper_waves_component.dart';

class ReactionsInfoAppBar extends StatelessWidget {
  const ReactionsInfoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 40,
      surfaceTintColor: Colors.transparent,
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
      flexibleSpace: FlexibleSpaceBar(background: UpperWaves()),
    );
  }
}
