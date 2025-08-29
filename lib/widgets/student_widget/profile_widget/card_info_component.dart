import 'package:flutter/material.dart';

import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/models/student_model/profile_model/profile_info_model.dart';
import 'package:smartpath/widgets/student_widget/profile_widget/custom_card_comonent.dart';

class Cards extends StatelessWidget {
  const Cards({super.key, required this.info});

  final List<ProfileInfoModel> info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          info.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CustomCard(
              icon: info[index].icon,
              data: info[index].content,
              style:
                  (info[index].icon == LucideIcons.mail)
                      ? AppStyles.styleRegular14()
                      : null,
            ),
          ),
        ),
      ),
    );
  }
}
