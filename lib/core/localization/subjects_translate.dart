import 'package:get/get.dart';

class ApiSubjectTranslator {
  static final Map<String, Map<String, String>> subjects = {
    'physics': {'en': 'physics', 'ar': 'الفيزياء'},
    'chemistry': {'en': 'chemistry', 'ar': 'الكيمياء'},
    'math': {'en': 'math', 'ar': 'الرياضيات'},
    'computer': {'en': 'computer', 'ar': 'الحاسوب'},
    'biology': {'en': 'biology', 'ar': 'علم الأحياء'},
    'history': {'en': 'history', 'ar': 'تاريخ'},
  };

  static String translate(String subject) {
    return subjects[subject]?[Get.locale?.languageCode ?? 'en'] ?? subject;
  }
}
