import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartpath/core/utils/general_utils/app_styles.dart';

class TitleWithDesc extends StatelessWidget {
  final String title;
  final String desc;
  const TitleWithDesc({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(44.43),
        // Title Page
        Text(title, style: AppStyles.styleBold22().copyWith()),
        const Gap(10),
        // Description page
        Text(desc, style: AppStyles.styleRegular16()),
      ],
    );
  }
}
