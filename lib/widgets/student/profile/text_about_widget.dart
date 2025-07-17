import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class TextAboutWidget extends StatelessWidget {
  const TextAboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'aboutApp_title'.tr,
              style: AppStyles.styleBold16().copyWith(color: Colors.indigo),
            ),
            const Gap(10),
            Text('aboutApp_desc'.tr),
            const Gap(5),
            const Divider(color: Colors.black54),
            Text(
              'aboutSc_title'.tr,
              style: AppStyles.styleBold16().copyWith(color: Colors.indigo),
            ),
            const Gap(10),
            Text('aboutSc_desc'.tr),
            const Gap(5),
            const Divider(color: Colors.black54),
            Text(
              'version'.tr,
              style: AppStyles.styleBold16().copyWith(color: Colors.indigo),
            ),
            const Gap(5),
            const Text('1.0.0', textDirection: TextDirection.ltr),
            const Divider(color: Colors.black54),
            Text(
              'rights'.tr,
              style: AppStyles.styleBold16().copyWith(color: Colors.indigo),
            ),
            const Gap(5),
            Text('rights_desc'.tr),
            const Text('© 2025', textDirection: TextDirection.ltr),
          ],
        ),
      ),
    );
  }
}
