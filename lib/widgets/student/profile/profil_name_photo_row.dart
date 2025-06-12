import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/core/utils/general_utils/app_styles.dart';

class ProfileNamePhotoRow extends StatelessWidget {
  const ProfileNamePhotoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(16),
        const CircleAvatar(radius: 40, child: Icon(LucideIcons.camera)),
        const Gap(24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi ,', style: AppStyles.styleRegular16().copyWith()),
            Text('Mohamad Serafi', style: AppStyles.styleMedium20().copyWith()),
          ],
        ),
      ],
    );
  }
}
