import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class LogoWithAppName extends StatelessWidget {
  const LogoWithAppName({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 5),
        child: Column(
          children: [
            Image.asset(
              AppAssets.pngLogo,
              height: 150,
              color: Colors.indigo,
              colorBlendMode: BlendMode.srcIn,
            ),
            const Gap(10),
            Text('app_name'.tr, style: AppStyles.styleBold16()),
          ],
        ),
      ),
    );
  }
}
