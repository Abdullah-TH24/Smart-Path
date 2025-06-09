import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/utils/general_utils/app_assets.dart';
import 'package:smartpath/utils/general_utils/app_routes.dart';
import 'package:smartpath/main.dart';

// ignore: must_be_immutable
class LangOptionPage extends StatelessWidget {
  LangOptionPage({super.key});
  LocalizationController locale = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 64),
            Expanded(
              child: FilledButton(
                onPressed: () {
                  prefs!.remove('introduction_state');
                  prefs!.remove('login_state');
                  locale.changeLanguage('ar');
                },
                child: const Text(
                  'عربي',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: FilledButton(
                onPressed: () {
                  precacheImage(
                    const AssetImage(Assets.gredientBackground),
                    context,
                  );
                  Get.offAllNamed(AppRoutes.studentMainPageRoute);
                  locale.changeLanguage('en');
                },
                child: const Text(
                  'English',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 64),
          ],
        ),
      ),
    );
  }
}
