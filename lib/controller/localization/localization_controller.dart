import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:smartpath/main.dart';

class LocalizationController extends GetxController {
  Locale initailLang =
      prefs!.getString('lang') == null
          ? Get.deviceLocale!
          : Locale('${prefs!.getString("lang")}');

  void changeLanguage(String lang) {
    final Locale locale = Locale(lang);
    Get.updateLocale(locale);
    prefs!.setString('lang', lang);
  }
}
