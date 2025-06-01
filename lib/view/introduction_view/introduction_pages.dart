// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/core/utils/general_utils/app_assets.dart';
import 'package:smartpath/core/utils/general_utils/app_routes.dart';
import 'package:smartpath/core/utils/general_utils/app_styles.dart';
import 'package:smartpath/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
            (context, index) => ListView(
              children: [
                SizedBox(height: Get.height / 6),
                Image.asset(
                  Assets.pngLogo,
                  colorBlendMode: BlendMode.srcIn,
                  color: Colors.indigo, // TODO color
                  width: 151.84,
                  height: 172.4,
                ),
                SizedBox(height: Get.height / 4),
                Text(
                  'introduction_title'.tr,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleBold22(
                    context,
                    color: const Color(0xff303030), // TODO color
                  ),
                ),
                Text(
                  'introduction_content_$index'.tr,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleRegular16(
                    context,
                    color: const Color(0xff9E95A2), // TODO color
                  ),
                ),
              ],
            ),
        itemCount: 3,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                controller.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.linear,
                );
              },
              icon: Icon(
                locale.initailLang == const Locale('en') ||
                        locale.initailLang == Get.deviceLocale
                    ? LucideIcons.chevronLeft
                    : LucideIcons.chevronRight,
                color: Colors.indigo, // TODO color
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const SwapEffect(
                dotHeight: 12.5,
                dotWidth: 12.5,
                paintStyle: PaintingStyle.fill,
                dotColor: Colors.black38, // TODO color
                activeDotColor: Colors.indigo, // TODO color
                type: SwapType.yRotation,
              ),
            ),
            IconButton(
              onPressed: () {
                if (controller.page == 2.0) {
                  Get.offAllNamed(AppRoutes.loginRoute);
                  prefs!.setBool('introduction_state', true);
                }
                controller.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.linear,
                );
              },
              icon: Icon(
                locale.initailLang == const Locale('en') ||
                        locale.initailLang == Get.deviceLocale
                    ? LucideIcons.chevronRight
                    : LucideIcons.chevronLeft,
                color: Colors.indigo, // TODO color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
