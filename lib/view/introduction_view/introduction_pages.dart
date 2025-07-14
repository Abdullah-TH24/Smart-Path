// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/localization_controller/localization_controller.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/intro_page_nav_bar.dart';

class IntroductionPages extends StatelessWidget {
  IntroductionPages({super.key});

  PageController controller = PageController();
  LocalizationController locale = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView.builder(
        controller: controller,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Get.height / 6),
                  Image.asset(
                    AppAssets.pngLogo,
                    color: Colors.indigo,
                    width: 151.84,
                    height: 172.4,
                  ),
                  SizedBox(height: Get.height / 5),
                  Text('introduction_title'.tr, style: AppStyles.styleBold22()),
                  const Gap(12),
                  Text(
                    'introduction_content_$index'.tr,
                    style: AppStyles.styleRegular16().copyWith(),
                  ),
                ],
              ),
            ),
        itemCount: 3,
      ),
      bottomNavigationBar: IntroPageNavBar(
        controller: controller,
        locale: locale,
      ),
    );
  }
}
