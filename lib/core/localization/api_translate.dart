import 'package:get/get.dart';

class ApiMessageTranslator {
  static final Map<String, Map<String, String>> messages = {
    'email & password does not match with our record!': {
      'ar': 'البريد الإلكتروني وكلمة المرور لا يتطابقان مع سجلنا!',
      'en': 'email & password does not match with our record!',
    },
    'User not found': {
      'ar': 'لم يتم العثور على المستخدم',
      'en': 'User not found',
    },
    'We sent a code to your email. If you do not receive a code, the email may not match an existing account.': {
      'ar':
          'لقد أرسلنا رمزًا إلى بريدك الإلكتروني. إذا لم تستلم الرمز، فقد لا يتوافق البريد الإلكتروني مع حسابك الحالي.',
      'en':
          'We sent a code to your email. If you do not receive a code, the email may not match an existing account',
    },
    'this password is already used': {
      'ar': 'تم استخدام كلمة المرور هذه بالفعل',
      'en': 'this password is already used',
    },
  };

  static String translate(String message) {
    return messages[message]?[Get.locale?.languageCode ?? 'en'] ?? message;
  }
}
