import 'package:get/get.dart';

class SubjectTranslator {
  static final Map<String, Map<String, String>> subjects = {
    'physics': {'en': 'Physics', 'ar': 'الفيزياء'},
    'chemistry': {'en': 'Chemistry', 'ar': 'الكيمياء'},
    'math': {'en': 'Math', 'ar': 'الرياضيات'},
    'computer': {'en': 'Computer', 'ar': 'الحاسوب'},
    'biology': {'en': 'Biology', 'ar': 'علم الأحياء'},
    'history': {'en': 'History', 'ar': 'التاريخ'},
  };

  static String translate(String subject) {
    return subjects[subject]?[Get.locale?.languageCode ?? 'en'] ?? subject;
  }
}
