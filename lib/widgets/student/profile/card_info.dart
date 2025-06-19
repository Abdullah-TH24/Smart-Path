import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/models/student_model/profile/profile_info_model.dart';
import 'package:smartpath/models/student_model/student_info_model.dart';
import 'package:smartpath/widgets/student/profile/custom_card.dart';

class Cards extends StatelessWidget {
  final StudentInfo studentInfo;
  const Cards({super.key, required this.info, required this.studentInfo});

  final List<ProfileInfoModel> info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          CustomCard(
            icon: LucideIcons.mail,
            data: '${studentInfo.email}',
            style: AppStyles.styleRegular14(),
          ),
          const Gap(10),
          CustomCard(
            icon: LucideIcons.phone,
            data: '${studentInfo.phoneNumber}',
          ),
          const Gap(10),
          CustomCard(
            icon: LucideIcons.school2,
            data: '${studentInfo.className}',
          ),
          const Gap(10),
          CustomCard(
            icon: LucideIcons.school,
            data: '${studentInfo.schoolGraduatedFrom}',
          ),
          const Gap(10),
          CustomCard(icon: LucideIcons.lineChart, data: '${studentInfo.gpa}'),
          const Gap(10),
          CustomCard(
            icon: LucideIcons.shieldCheck,
            data: studentInfo.expelled == 0 ? 'Active' : 'Expelled',
          ),
        ],
      ),
    );
  }
}
