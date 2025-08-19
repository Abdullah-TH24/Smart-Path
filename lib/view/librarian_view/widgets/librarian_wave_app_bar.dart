import 'package:flutter/material.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/core/utils/app_colors.dart';
import 'package:smartpath/widgets/student/profile/upper_waves_component.dart';

class LibrarianWaveAppBar extends StatelessWidget {
  final dynamic title;
  const LibrarianWaveAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,

      expandedHeight: 80,
      flexibleSpace: FlexibleSpaceBar(
        background: UpperWaves(color: getColor().appBarColor),
        titlePadding: const EdgeInsets.only(left: 16, bottom: 8, right: 16),
        centerTitle: true,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.styleMedium14().copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
