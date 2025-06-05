// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/core/utils/general_utils/app_routes.dart';
import 'package:smartpath/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPageNavBar extends StatelessWidget {
  const IntroPageNavBar({
    super.key,
    required this.controller,
    required this.locale,
  });

  final PageController controller;
  final LocalizationController locale;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              color: Colors.indigo,
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const SwapEffect(
              dotHeight: 12.5,
              dotWidth: 12.5,
              paintStyle: PaintingStyle.fill,
              dotColor: Colors.black38,
              activeDotColor: Colors.indigo,
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
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }
}
