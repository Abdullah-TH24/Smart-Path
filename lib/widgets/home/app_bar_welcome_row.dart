import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartpath/utils/general_utils/app_styles.dart';

class AppBarWelcomeRow extends StatelessWidget {
  const AppBarWelcomeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi,',
                style: AppStyles.styleRegular16().copyWith(color: Colors.white),
              ),
              Text(
                'Mohamad Serafi',
                style: AppStyles.styleMedium20().copyWith(color: Colors.white),
              ),
            ],
          ),
          const Gap(120),
          const Icon(Icons.image, color: Colors.white),
        ],
      ),
    );
  }
}
