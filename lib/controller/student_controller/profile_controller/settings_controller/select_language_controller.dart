import 'package:get/get.dart';
import 'package:smartpath/controller/localization_controller/localization_controller.dart';

class SelectLanguageController extends GetxController {
  int? groupLangauge = (Get.locale?.languageCode ?? 'en') == 'en' ? 2 : 1;
  LocalizationController locale = Get.find();

  changeLanguageToArabic() {
    locale.changeLanguage('ar');
    update();
  }

  changeLanguageToEnglish() {
    locale.changeLanguage('en');
    update();
  }
}
