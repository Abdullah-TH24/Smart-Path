// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/student/profile/upper_waves_component.dart';

class LibrarianWaveAppBar extends StatelessWidget {
  const LibrarianWaveAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 80,
      flexibleSpace: FlexibleSpaceBar(
        background: UpperWaves(color: Colors.brown.withValues(alpha: 0.3)),
        titlePadding: const EdgeInsets.only(left: 16, bottom: 8, right: 16),
        title: Text(
          'books'.tr,
          style: AppStyles.styleMedium14().copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
