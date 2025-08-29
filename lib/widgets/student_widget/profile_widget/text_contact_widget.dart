import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class TextContactWidget extends StatelessWidget {
  const TextContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'page_desc'.tr,
              textAlign: TextAlign.center,
              style: AppStyles.styleRegular12().copyWith(
                // color: Colors.indigo,
              ),
            ),
            const Gap(30),
            const Divider(color: Colors.black54),
            Text(
              'address_title'.tr,
              style: AppStyles.styleBold16().copyWith(color: Colors.indigo),
            ),
            const Gap(10),
            Text('address_content'.tr),
            const Gap(5),
            const Divider(color: Colors.black54),
            Text(
              'phone_title'.tr,
              style: AppStyles.styleBold16().copyWith(color: Colors.indigo),
            ),
            const Gap(10),
            const Text('+966 123 456 789', textDirection: TextDirection.ltr),
            const Gap(5),
            const Divider(color: Colors.black54),
            Text(
              'email_title'.tr,
              style: AppStyles.styleBold16().copyWith(color: Colors.indigo),
            ),
            const Gap(10),
            const Text('info@alriyada.edu.sa'),
            const Gap(5),
            const Divider(color: Colors.black54),
            Text(
              'website_title'.tr,
              style: AppStyles.styleBold16().copyWith(color: Colors.indigo),
            ),
            const Gap(10),
            const Text('www.alriyada.edu.sa'),
            const Gap(5),
            const Divider(color: Colors.black54),
            Text(
              'facebook_title'.tr,
              style: AppStyles.styleBold16().copyWith(color: Colors.indigo),
            ),
            const Gap(10),
            const Text('fb.com/alriyada.school'),
            const Gap(5),
            const Divider(color: Colors.black54),
            Text(
              'working_title'.tr,
              style: AppStyles.styleBold16().copyWith(color: Colors.indigo),
            ),
            const Gap(10),
            Row(
              children: [
                Text('${'working_day'.tr}: '),
                const Text(
                  '${'8:00AM'} - ${'2:00PM'}',
                  textDirection: TextDirection.ltr,
                ),
              ],
            ),
            Text('${'holiday_day'.tr}: ${'holiday_desc'.tr}'),
            const Gap(5),
            const Divider(color: Colors.black54),
          ],
        ),
      ),
    );
  }
}
