import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/main.dart';

// ignore: must_be_immutable
class HomeStudent extends StatelessWidget {
  HomeStudent({super.key});
  LocalizationController locale = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                prefs!.remove('introduction_state');
                prefs!.remove('login_state');
                locale.changeLanguage('ar');
              },
              child: const Text('Arabic'),
            ),
            const SizedBox(width: 15),
            ElevatedButton(
              onPressed: () {
                locale.changeLanguage('en');
              },
              child: const Text('English'),
            ),
          ],
        ),
      ),
    );
  }
}
