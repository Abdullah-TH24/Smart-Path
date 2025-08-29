import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:smartpath/core/utils/app_assets.dart';

class LogoWithTitle extends StatelessWidget {
  const LogoWithTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // <Logo>
        Image.asset(
          AppAssets.pngLogo,
          // height: 62.06,
          // width: 52.01,
          color: Colors.indigo,
          colorBlendMode: BlendMode.srcIn,
        ),
        const Gap(10),
        // <Smart Path>
        Text('app_name'.tr, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
